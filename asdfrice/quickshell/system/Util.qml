pragma Singleton
import Quickshell

Singleton {
    function formatPercentage(value){
        return Math.round(value * 100) + "%"
    }
}
