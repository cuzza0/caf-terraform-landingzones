module "caf-enterprise-scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "0.0.5-preview"

  root_parent_id            = "e9e7e695-ae50-4a53-8f15-1f30bd9a2886"

  # Define a custom ID to use for the root Management Group
  # Also used as a prefix for all core Management Group IDs
  root_id                   = "cuzza"

  # Define a custom "friendly name" for the root Management Group
  root_name                 = "CuzzaDev ES"

  # Control whether to deploy the default core landing zones // default = true
  deploy_core_landing_zones = true

  # Control whether to deploy the demo landing zones // default = false
  deploy_demo_landing_zones = false

  # Set a path for the custom archetype library path
  library_path    = "${path.root}/lib"

  custom_landing_zones = {
    #------------------------------------------------------#
    # This variable is used to add new Landing Zones using
    # the Enterprise-scale deployment model.
    # Simply add new map items containing the required
    # attributes, and the Enterprise-scale core module will
    # take care of the rest.
    # To associated existing Management Groups which have
    # been imported using "terraform import ...", please ensure
    # the key matches the id (Name) of the imported Management
    # Group and ensure all other values match the existing
    # configuration.
    #------------------------------------------------------#
    cuzza-lz-online = {
      display_name               = "Online"
      parent_management_group_id = "cuzza-landing-zones"
      subscription_ids           = [
        "515a544b-6ef3-4ec9-a40d-0e5f5d5e1b67"
      ]
      archetype_config = {
        archetype_id = "es_demo_online"
        parameters   = {}
        access_control = {}
      }
    }
    cuzza-lz-shared = {
      display_name               = "Shared"
      parent_management_group_id = "cuzza-landing-zones"
      subscription_ids           = [
        "6385cea1-3ea5-4ceb-8435-123bb363808a"
      ]
      archetype_config = {
        archetype_id = "es_demo_online"
        parameters = {}
        access_control = {}
      }
    }
    #------------------------------------------------------#
    # EXAMPLES
    #------------------------------------------------------#
    # web-proxy = {
    #   display_name               = "Web Proxy"
    #   parent_management_group_id = "es-connectivity"
    #   subscription_ids           = []
    #   archetype_config = {
    #     archetype_id = "es_customer_online"
    #     parameters = {
    #       policy_assignment_id = {
    #         param_name_1 = param_value_1
    #         param_name_2 = param_value_2
    #         param_name_3 = param_value_3
    #       }
    #     }
    #   }
    # }
    #------------------------------------------------------#
  }

  # The following var provides an example for how to specify
  # custom archetypes for the connectivity Landing Zones
  archetype_config_overrides = {
    #------------------------------------------------------#
    # This variable is used to configure the built-in
    # Enterprise-scale Management Groups with alternate
    # (or custom) name and parameters.
    # Simply uncomment the one(s) you want to modify and
    # provide the required values.
    #------------------------------------------------------#
    # root = {
    #   archetype_id = "es_root"
    #   parameters   = {}
    # }
    # decommissioned = {
    #   archetype_id = "es_decommissioned"
    #   parameters   = {}
    # }
    # sandboxes = {
    #   archetype_id = "es_sandboxes"
    #   parameters   = {}
    # }
    # landing_zones = {
    #   archetype_id = "es_landing_zones"
    #   parameters   = {}
    # }
    # platform = {
    #   archetype_id = "es_platform"
    #   parameters   = {}
    # }
    # connectivity = {
    #   archetype_id = "es_connectivity_foundation"
    #   parameters   = {}
    # }
    # management = {
    #   archetype_id = "es_management"
    #   parameters   = {}
    # }
    # identity = {
    #   archetype_id = "es_identity"
    #   parameters   = {}
    # }
    # demo_corp = {
    #   archetype_id = "es_demo_corp"
    #   parameters   = {}
    # }
    # demo_online = {
    #   archetype_id = "es_demo_online"
    #   parameters   = {}
    # }
    # demo_sap = {
    #   archetype_id = "es_demo_sap"
    #   parameters   = {}
    # }
    #------------------------------------------------------#
    # EXAMPLES
    #------------------------------------------------------#
    # connectivity = {
    #   archetype_id = "es_connectivity_vwan"
    #   parameters = {
    #     policy_assignment_id = {
    #       param_name_1 = param_value_1
    #       param_name_2 = param_value_2
    #       param_name_3 = param_value_3
    #     }
    #   }
    # }
    #------------------------------------------------------#
  }

  subscription_id_overrides = {
    #------------------------------------------------------#
    # This variable is used to associate Azure subscription_ids
    # with the built-in Enterprise-scale Management Groups.
    # Simply add one or more Subscription IDs to any of the
    # built-in Management Groups listed below as required.
    #------------------------------------------------------#
    root           = []
    decommissioned = []
    sandboxes      = []
    landing-zones  = []
    platform       = []
    connectivity   = [
      "7727fad1-0a13-4b52-a28f-b6a20a09c35d"
    ]
    management     = [
      "899bd253-35a8-4548-baf2-b45d08d822ea"
    ]
    identity       = [
      "b4dacc3f-714b-49b9-a062-8e0181f0a388"
    ]
    demo-corp      = []
    demo-online    = []
    demo-sap       = []
    #------------------------------------------------------#
    # EXAMPLES
    #------------------------------------------------------#
    # connectivity = [
    #   "3117d098-8b43-433b-849d-b761742eb717",
    # ]
    # management = [
    #   "9ee716a9-e411-433a-86ea-d82bf7b7ca61",
    # ]
    # identity = [
    #   "cae4c823-f353-4a34-a91a-acc5a0bd65c7",
    # ]
    #------------------------------------------------------#
  }

}