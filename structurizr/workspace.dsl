workspace "Name" "Description" {

    !identifiers hierarchical
    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        monaco = group "Monaco" {

                PublicApplication = softwareSystem "Public Application" {
                    tags "Azure Container Application"
                    url "https://ca-nexiusai-public-monaco.ambitiousforest-2350b2d0.westeurope.azurecontainerapps.io"
                }
                PrivateAlfaApplication = softwareSystem "Private Alfa Application" {
                                    tags "Azure Container Application"
                                    url "https://ca-nexiusai-public-monaco.ambitiousforest-2350b2d0.westeurope.azurecontainerapps.io/alfa"
                                }
                                PrivateBetaApplication = softwareSystem "Private Beta Application" {
                                                                    tags "Azure Container Application"
                                                                    url "https://ca-nexiusai-public-monaco.ambitiousforest-2350b2d0.westeurope.azurecontainerapps.io/beta"
                                                                }
            }


        publicInternet = softwareSystem "Public Internet" {
            tags "Public Internet"
            description "The public internet"
        }
        publicInternet -> PublicApplication "Uses"
        PublicApplication -> PrivateAlfaApplication "Uses"
        PublicApplication -> PrivateBetaApplication "Uses"

    }
    views {
        properties {
            "structurizr.sort" "created"
        }
        systemLandscape "Overview" {
            include monaco publicInternet
            autolayout tb
        }


        styles {
            element "Azure Container Application" {
                shape RoundedBox
                background #0078D4
                color #FFFFFF
            }
            element "Azure Container Application Environment" {
                shape Hexagon
                background #005A9E
                color #FFFFFF
            }
            element "Azure Log Analytics" {
                shape Cylinder
                background #6B52AE
                color #FFFFFF
            }
            element "Azure PostgreSql Database" {
                shape Cylinder
                background #00B7C3
                color #FFFFFF
            }
            element "Azure MongoDb" {
                shape Cylinder
                background #00758F
                color #FFFFFF
            }
            element "Azure Key Vault" {
                shape Hexagon
                background #6C9BD1
                color #FFFFFF
            }
            element "Azure Blob Storage" {
                shape Folder
                background #4F6BED
                color #FFFFFF
            }
            element "Azure Redis Cache" {
                shape Cylinder
                background #005B9F
                color #FFFFFF
            }
            element "Azure Web App" {
                shape RoundedBox
                background #1490DF
                color #FFFFFF
            }
            element "Azure SignalR" {
                shape Hexagon
                background #3E8EDE
                color #FFFFFF
            }
            element "External System" {
                shape RoundedBox
                background #FF9800
                color #000000
            }
            element "Public Internet" {
                shape Ellipse
                background #CCCCCC
                color #000000
            }
        }
    }
}
