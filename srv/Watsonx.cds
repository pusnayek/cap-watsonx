using { WT as WT } from '../db/structures/WT';

@path: 'service/challenge'
service WatsonxService {

    function getGreetings() returns String;

    function getProducts(lower: Integer, upper: Integer) returns array of Products;

    function getProductsDescribed(lower: Integer, upper: Integer) returns String;

    function getProductDetails(productname: String) returns Products;

    function getUpsellProductDetails(productname: String) returns Products;

    function getAddonDetails(addoname: String) returns Addons;

    function getAddonsDescribed(lower: Integer, upper: Integer) returns String;

    function getAddons(lower: Integer, upper: Integer) returns array of Addons;

    function getBillingSummaryDescribed(product: String, addon: String) returns String;

    @readonly
    entity Products as projection on WT.Products;

    @readonly
    entity Addons as projection on WT.Addons;

}