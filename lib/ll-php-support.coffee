LlPhpSupportView = require './ll-php-support-view'
{CompositeDisposable} = require 'atom'

GotoManager = require "./goto/goto-manager.coffee"
TooltipManager = require "./tooltip/tooltip-manager.coffee"
AnnotationManager = require "./annotation/annotation-manager.coffee"
AutocompletionManager = require "./autocompletion/autocompletion-manager.coffee"
StatusInProgress = require "./services/status-in-progress.coffee"
config = require './config.coffee'
proxy = require './services/php-proxy.coffee'
parser = require './services/php-file-parser.coffee'
plugins = require './services/plugin-manager.coffee'



module.exports = LlPhpSupport =
    llPhpSupportView: null
    modalPanel: null
    subscriptions: null

    config:

        binPhp:
            title: 'Command php'
            description: 'This plugin use php CLI in order to work. Please specify your php
         command ("php" on UNIX systems)'
            type: 'string'
            default: 'php'
            order: 2

        autoloadPaths:
            title: 'Autoloader file'
            description: 'Absolute path, Relative path to the files of autoload.php from composer (or an other one). You can specify multiple
         paths (comma separated) if you have different paths for some projects.'
            type: 'array'
            default: ['vendor/autoload.php', 'autoload.php']
            order: 3

        classMapFiles:
            title: 'Classmap files'
            description: 'Absolute path, Relative path to the files that contains a classmap (array with "className" => "fileName"). By default
         on composer it\'s vendor/composer/autoload_classmap.php'
            type: 'array'
            default: ['vendor/composer/autoload_classmap.php', 'autoload/ezp_kernel.php']
            order: 4



    activate: (state) ->
        config.testConfig()
        config.init()

        @gotoManager = new GotoManager()
        @gotoManager.init()


        @autocompletionManager = new AutocompletionManager()
        @autocompletionManager.init()

        @tooltipManager = new TooltipManager()
        @tooltipManager.init()

        @annotationManager = new AnnotationManager()
        @annotationManager.init()
        return

    deactivate: ->
        @gotoManager.deactivate()
        @tooltipManager.deactivate()
        @annotationManager.deactivate()
        @autocompletionManager.deactivate()

    getProvider: ->
        return @autocompletionManager.getProviders()

    provideAutocompleteTools: ->
        @services =
            proxy: proxy
            parser: parser

        return @services
