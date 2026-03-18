pragma Singleton
import Quickshell

Singleton {
    function formatPercentage(value) {
        return Math.round(value * 100) + "%";
    }

    function roundFloat(value, digit) {
        let mul = Math.pow(10, digit);
        return Math.round(value * mul) / mul;
    }

    function formatGib(value) {
        return roundFloat(value / Math.pow(1024, 3), 2);
    }

    function formatKj(value) {
        return roundFloat(value / 1000, 0);
    }

    function formatBytes(value) {
        const units = ["B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB", "RiB", "QiB"];
    //todo
    }
}
