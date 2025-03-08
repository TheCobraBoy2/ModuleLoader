# ModuleLoader

ModuleLoader is a utility for loading modules in Roblox.

## Installation

To install ModuleLoader, simply copy the `ModuleLoader` script into your Roblox project.

## Usage

1. Place the `ModuleLoader` script in ReplicatedStorage.
2. Require and run the `ModuleLoader` script in your main Client and Server script

The only difference from client and server is client should be:

```lua
local ModuleLoader = require(game:GetService("ReplicatedStorage"):WaitForChild("ModuleLoader"))
moduleLoader.start(script.Handlers)
```

While server should be:

```lua
local ModuleLoader = require(game:GetService("ReplicatedStorage").ModuleLoader)
moduleLoader.start(script.Services)
```

An example of a Service would be:

```lua
local ExampleService = {}

-- OPTIONAL
function ExampleService:Init()
    -- Doesnt halt
    task.delay(1, function()

    end)

    -- Halts the main thred
    task.wait(1)
end
-- OPTIONAL
function ExampleService:Start()
    -- Halts the main thred
    task.wait(1)
end
```

An example of a Handler would be:

```lua
local ExampleHandler = {}

-- OPTIONAL
function ExampleHandler:Init()
    -- Doesnt halt
    task.delay(1, function()

    end)

    -- Halts the main thred
    task.wait(1)
end
-- OPTIONAL
function ExampleHandler:Start()
    task.wait(1)
end
```

To run a module in parallel add a boolean attribute to the module called "Parallel" and set it to true.

You should NOT hog the main thread of execution in the :Init() or :Start function.
If you need an infinite while loop withing these functions, place it in a separate corouting using task.spawn() or task.defer().

Modules are required first, then :Init(), finally :Start()

The loader will print the modules it is loading if the VERBOSE_LOADING setting is true, I recommend setting this set to false when in production. The default is false.

The FOLDER_SEARCH_DEPTH setting changes how many folders the loader will search through. The default is 0.

You can change the settings in the init.luau file.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License.

## Contact

For any questions or suggestions, please open an issue or contact me via my discord (vorrikz).
