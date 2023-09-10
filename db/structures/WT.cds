namespace WT;

using { managed } from '@sap/cds/common';
using { Structures } from './aspects';


entity Products {
    key produId        : String(100);
        brand          : String(100);
        category       : String(100);
        price          : Integer;
        currency       : String(10);
        description    : String(5000);
        xtags          : String(100);
        extra1         : String(1000);
        extra2         : String(1000);  
        extra3         : String(1000);
        extra4         : String(1000);  
        extra5         : String(1000);
        extra6         : String(1000);  
        extra7         : String(1000);
        extra8         : String(1000);  
};

entity Addons {
    key produId        : String(100);
        brand          : String(100);
        category       : String(100);
        price          : Integer;
        currency       : String(10);
        description    : String(1000);
        xtags          : String(100);
        extra1         : String(1000);
        extra2         : String(1000);  
        extra3         : String(1000);
        extra4         : String(1000);  
};

