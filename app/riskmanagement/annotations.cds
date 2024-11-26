using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'grp1',
            ID : 'grp1',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'frm1 risks',
                    ID : 'frm1risks',
                    Target : '@UI.FieldGroup#frm1risks',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'grp2',
            ID : 'grp2',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'frm2',
                    ID : 'frm2',
                    Target : '@UI.FieldGroup#frm2',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Owner',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority ',
            Value : prio_code,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impact',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>MitiDescr}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : 'BP Contact Name',
        },
    ],
    UI.SelectionFields : [
        prio_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #frm1risks : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : 'impact',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataField',
                Value : criticality,
                Label : 'criticality',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : 'owner',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataField',
                Value : PrioCriticality,
                Label : 'PrioCriticality',
            },
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : 'Contact Name',
            },
        ],
    },
    UI.FieldGroup #frm2 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.descr,
                Label : 'descr',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'owner',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : 'timeline',
            },
        ],
    },
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};

annotate service.Risks with {
    prio @(
        Common.Label : 'Priority',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
);

