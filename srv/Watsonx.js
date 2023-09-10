const cds = require('@sap/cds')

class WatsonxService extends cds.ApplicationService { init() {
  const { Products, Addons } = this.entities;

  this.on('getGreetings', () => 'Hello World' ) 

  this.on('getProducts', async (req) => {
    // let query = 'SELECT * from WT_PRODUCTS'
    // return await cds.db.run (query);    
    // return SELECT.from(Products).where('price' < req.data.upper);
    let tx = cds.transaction(req)
    var products = await tx.run(SELECT.from(Products));
    return products.filter((product) => {
      return product.price < req.data.upper && product.price >= req.data.lower
    })
  }) 

  this.on('getAddons', async (req) => {
    let tx = cds.transaction(req)
    var addons = await tx.run(SELECT.from(Addons));

    return addons.filter((addon) => {
      return addon.price < req.data.upper && addon.price >= req.data.lower
    })
  }) 


  this.on('getProductsDescribed', async (req) => {
    let tx = cds.transaction(req)
    var products = await tx.run(SELECT.from(Products));

    var list = products.filter((product) => {
      return product.price < req.data.upper && product.price >= req.data.lower
    }).map((item) => {
      return "<b>".concat(item.extra1).concat("</b>, with price ").concat(item.price).concat(" ").concat(item.currency)
    })
    
    return list.join('<br>');
  }) 

  this.on('getAddonsDescribed', async (req) => {
    let tx = cds.transaction(req)
    var addons = await tx.run(SELECT.from(Addons));

    var list = addons.filter((addon) => {
      return addon.price < req.data.upper && addon.price >= req.data.lower
    }).map((item) => {
      return "<b>".concat(item.extra1).concat("</b>, with price ").concat(item.price).concat(" ").concat(item.currency)
    })
    
    return list.join('<br>');
  }) 

  this.on('getBillingSummaryDescribed', async (req) => {
    let tx = cds.transaction(req)

    var addons = await tx.run(SELECT.from(Addons));
    var products = await tx.run(SELECT.from(Products));

    var items = products.filter((product) => {
      return product.extra1 === req.data.product
    }).concat(addons.filter((addon) => {
      return addon.extra1 === req.data.addon
    }));
    
    var sum = items.reduce((accumulator, curr) => accumulator + curr.price);

    var table = items.map((item) => {
      return "<tr><td>" + item.extra3 + "</td><td>" + item.price + item.currency + "</td><td></tr>"
    });

    table.push("<tr><td>Amount payable</td><td>" + sum + "</td><td></tr>");

    return "<table>" + table.join() + "</table>"
  }) 

  this.on('getProductDetails', async (req) => {
    let tx = cds.transaction(req)
    var products = await tx.run(SELECT.from(Products));
    var productName = req.data.productname.replace('+',' ').toUpperCase()
    // return products.shift()
    return products.filter((product) => {
      return product.extra1.toUpperCase() === productName
    }).shift()
  }) 

  this.on('getAddonDetails', async (req) => {
    let tx = cds.transaction(req)
    var addons = await tx.run(SELECT.from(Addons));

    return addons.filter((addon) => {
      return addon.extra1 === req.data.addoname
    }).shift()
  }) 

  this.on('getUpsellProductDetails', async (req) => {
    let tx = cds.transaction(req)
    var products = await tx.run(SELECT.from(Products));

    return products.filter((product) => {
      return product.extra1 === req.data.productname
    }).shift()
  }) 

  return super.init()
}}

module.exports = { WatsonxService }