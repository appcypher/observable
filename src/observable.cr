abstract class Observable
    abstract def notify()
    abstract def add_subscription(sub : Subscription)
end


abstract class Observer
    abstract def react(obs : Observable)
end


class Subscription
    @observers = [] of Observer

    def enlist(obs : Observer)
        @observers << obs
    end

    def notify(obs : Observable)
        @observers.each do |observer|
            observer.react(obs)
        end
    end
end
