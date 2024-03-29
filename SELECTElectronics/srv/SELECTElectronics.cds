using { com.satinfotech.selectelectronicsdb as db} from '../db/schema';


service SELECTElectronics {
    entity BusinessPartner as projection on db.BusinessPartner{
        @UI.Hidden
        ID,
        *
    };
    entity Store as projection on db.Store{
        @UI.Hidden
        ID,
        *
    };
    entity Product as projection on db.Product{
        @UI.Hidden
        ID,
        *
    };
    entity StockData as projection on db.StockData{
        @UI.Hidden
        ID,
        *
    };
    entity Purchase as projection on db.Purchase{
        @UI.Hidden
        ID,
        *
    };
    entity State as projection on db.State;
     entity Sales as projection on db.Sales{
        @UI.Hidden
        ID,
        *
    };
    
}

annotate SELECTElectronics.BusinessPartner with @odata.draft.enabled;
annotate SELECTElectronics.Store with @odata.draft.enabled;
annotate SELECTElectronics.Product with @odata.draft.enabled;
annotate SELECTElectronics.StockData with @odata.draft.enabled;
annotate SELECTElectronics.Purchase with @odata.draft.enabled;
annotate SELECTElectronics.Sales with @odata.draft.enabled;

annotate SELECTElectronics.BusinessPartner with {
    first_name      @assert.format: '^[a-zA-Z]{2,}$';
    last_name      @assert.format: '^[a-zA-Z]{2,}$';    
    pin_code    @assert.format: '^[1-9][0-9]{5}$';
    gstin_number    @assert.format : '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
}


annotate SELECTElectronics.Store with {
    pin_code    @assert.format: '^[1-9][0-9]{5}$';
}

annotate SELECTElectronics.Product with {
   product_img_url  @assert.format : '(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)'
}

annotate SELECTElectronics.State with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ]
);

annotate SELECTElectronics.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        
    ],
    UI.SelectionFields: [ store_id,name],       
);

annotate SELECTElectronics.Store with @(
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
           {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'Store Information',
            Target : '@UI.FieldGroup#StoreInformation',
        },
    ],    
);

annotate SELECTElectronics.BusinessPartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
             $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
             $Type : 'UI.DataField',
            Value : gstin_number
        },
        {
             $Type : 'UI.DataField',
            Value : is_vendor
        },
        {
             $Type : 'UI.DataField',
            Value : is_customer
        }
    ],
    UI.SelectionFields: [ business_partner_number,first_name , last_name],       
);

annotate SELECTElectronics.BusinessPartner with @(
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
             $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
             $Type : 'UI.DataField',
            Value : gstin_number
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'Business Partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
    ],    
);

annotate SELECTElectronics.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img_url
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost_price
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell_price
        },
    ],
    UI.SelectionFields: [ product_id,product_name],       
);

annotate SELECTElectronics.Product with @(
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img_url
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost_price
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell_price
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
    ],    
);

annotate SELECTElectronics.StockData with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id.name
        },
        {
            $Type : 'UI.DataField',
            Value : product_id.product_name
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
    ],
    UI.SelectionFields: [ store_id_ID,product_id_ID],       
);

annotate SELECTElectronics.StockData with @(
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : store_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_id_ID
        },
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
    ],    
);



annotate SELECTElectronics.Purchase with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number.first_name
        },
        {
            $Type : 'UI.DataField',
            Value : purchase_order__date
        },
    ],
    UI.SelectionFields: [ ],       
);

annotate SELECTElectronics.Purchase with @(
    UI.FieldGroup #PurchaseInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : pod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : purchase_order__date
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseInfoFacet',
            Label : 'Purchase Information',
            Target : '@UI.FieldGroup#PurchaseInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PurchaseItemsFacet',
            Label : 'Purchase Items Information',
            Target : 'Items/@UI.LineItem',
        },
    ],    
);



annotate SELECTElectronics.Sales with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : sod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : sales_date
        },
    ],
    UI.SelectionFields: [ ],       
);

annotate SELECTElectronics.Sales with @(
    UI.FieldGroup #SalesInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
            $Type : 'UI.DataField',
            Value : sod
        },
        {
            $Type : 'UI.DataField',
            Value : business_partner_number_ID
        },
        {
            $Type : 'UI.DataField',
            Value : sales_date
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SalesInfoFacet',
            Label : 'Sales Information',
            Target : '@UI.FieldGroup#SalesInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SalesItemsFacet',
            Label : 'Sales Items Information',
            Target : 'Items/@UI.LineItem',
        }
    ],    
);


annotate SELECTElectronics.BusinessPartner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
}

annotate SELECTElectronics.Purchase with {
    business_partner_number @(
        Common.Text: business_partner_number.first_name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Business Partners',
            CollectionPath : 'BusinessPartner',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : business_partner_number_ID,
                    ValueListProperty : 'ID'
                },
               {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'business_partner_number'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'first_name'
                },
            ]
        }
    )
}


annotate SELECTElectronics.Sales with {
    business_partner_number @(
        Common.Text: business_partner_number.first_name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Business Partners',
            CollectionPath : 'BusinessPartner',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : business_partner_number_ID,
                    ValueListProperty : 'ID'
                },
               {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'business_partner_number'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'first_name'
                },
            ]
        }
    )
}

annotate SELECTElectronics.StockData with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stores',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
};


annotate SELECTElectronics.Product with {
@Common.Text : '{Product}'
@Core.IsURL : true
@Core.MediaType : 'image/png/jpg'
product_img_url
}


annotate SELECTElectronics.Purchase.Items with @(
    UI.LineItem:[
        {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
    ],

     UI.FieldGroup #PurchaseItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : '@UI.FieldGroup#PurchaseItems',
        },
    ],  
);


annotate SELECTElectronics.Sales.Items with @(
    UI.LineItem:[
        {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
    ],

     UI.FieldGroup #SalesItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            Label: 'Product ID',
            Value: product_id_ID
        },
        {
            Label: 'Quantity',
            Value: qty
        },
        {
            Label: 'Price',
            Value: price
        },
       {
            Label: 'Store',
            Value: store_id_ID
        },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items',
            Target : '@UI.FieldGroup#SalesItems',
        },
    ],  
);


annotate SELECTElectronics.Purchase.Items with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stores',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
};


annotate SELECTElectronics.Sales.Items with {
    store_id @(
        Common.Text: store_id.store_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Stores',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'store_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    product_id @(
        Common.Text: product_id.product_id,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Products',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id_ID,
                    ValueListProperty : 'ID'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_id'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
};






