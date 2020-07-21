## OBSERVABLE
A simple observable library for personal use really.

### USAGE
- Import into your project

    - Add the following in your `shard.yml` file

    ```yml
    dependencies:
        agent:
            github: appcypher/observable
    ```

    - Import classes into your project

    ```crystal
    require "observable"

    class NewsMedia < Observable
        getter subscription : Subscription

        private def notify()
            subscription.notify(self)
        end

        private def add_subscription(sub : Subscription)
            @subscription = subscription
        end

        def initialize(sub : Subscription)
            # ...
            add_subscription(sub)
            some_source() do |news|
                notify()
            end
        end

        # ...
    end

    class Reader < Observer
        def react(obs : Observable)
            puts "Wow! That is crazy."
        end
    end

    cnn = NewsMedia.new(Subscription.new)
    reader = Reader.new
    cnn.subscription.enlist(reader)
    ```
