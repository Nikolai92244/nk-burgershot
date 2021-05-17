Config = {}
Config.Locale = 'en'
Config.DrawDistance = 100.0
Config.Marker = { type = 2, x = 0.7, y = 0.7, z = 0.7, r = 222, g = 38, b = 38, a = 255, rotate = false }

Config.Burger1 = 'bleeder' -- item name in database
Config.Burger2 = 'chickensandwich'
Config.Burger3 = 'heartstopper'
Config.Burger4 = 'meat_free'
Config.Burger5 = 'moneyshot'
Config.Burger6 = 'torpedo'
Config.fries = 'fries'
Config.Drink = 'softdrinks'
Config.Donut = 'donut'
Config.Muffin = 'muffin'
--

Config.Blips = {
  {title="Taco Shop", colour=2, id=478, size = 0.8, x = 11.1, y = -1605.68, z = 29.39},
}
Crafting = {}

Crafting.Locations = {
    [1] = {x = -0.0, y=0, z=0},
}

Crafting.Items = {
    ["torpedo"] = {
        label = "Torpedo",
        needs = {                                           
            ["letuce"] = {label = "Letuce", count = 5},
            ["bread"] = {label = "Bread", count = 4},
            ["sambal"] = {label = "Sambal", count = 4},
            ["packaged_chicken"] = {label = "Chicken Fillet", count = 7},
            ["hapati"] = {label = "Hamburger Patty", count = 3},
        },
        threshold = 0,
    },
    ["friesfrench"] = {
        label = "French Fries",
        needs = {
            ["potato"] = {label = "Potato", count = 10},
        },
        threshold = 0,
    },
    ["heartstoper"] = {
      label = "Mega Burger",
      needs = {
          ["potato"] = {label = "Potato", count = 10},
          ["packaged_chicken"] = {label = "Chicken Fillet", count = 10},
          ["sambal"] = {label = "Sauce", count = 10},
          ["bread"] = {label = "Bread", count = 3},
          ["garam"] = {label = "Garam", count = 7},
          ["hapati"] = {label = "Hamburger Patty", count = 6},
      },
      threshold = 0,
     },
    ["burger"] = {
        label = "Cheese Burger",
        needs = {
            ["packaged_chicken"] = {label = "Chicken Fillet", count = 1},
            ["letuce"] = {label = "Letuce", count = 4},
            ["cheedar"] = {label = "Cheese", count = 3},
            ["hapati"] = {label = "Hamburger Patty", count = 5},
            ["bread"] = {label = "Bread", count = 2},
        },
        threshold = 0,
    },
}

Config.drinkmake = {
  { x = -1199.2, y = -894.97, z = 14.0}
}

Config.drinkmake2 = {
  { x = -1189.74, y = -905.67, z = 14.0}
}

Config.donutgrab = {
  { x = -1203.29, y = -895.03, z = 14.0}
}

Config.Locations = {
  ["stashburger"] = {
      label = "Burgerstash",
      coords = {x =-1196.13, y =-904.46, z =14.0, h =119.6},
  },

  ["stashingredient"] = {
    label = "Stash Ingredient",
    coords = {x =0, y =0, z =0, h =0},
  },

  ["stashpickup"] = {
    label = "Stash Pickup Order",
    coords = {x =0, y =0, z =0, h =130.14},
  }, 
  
}

