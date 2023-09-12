using System;

class RemoteControlCar
{
    private int _distance = 0;
    private int _battery = 100;

    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return String.Format("Driven {0} meters", _distance);
    }

    public string BatteryDisplay()
    {
        if (_battery == 0)
        {
            return "Battery empty";
        }
        else
        {
            return String.Format("Battery at {0}%", _battery);
        }
    }

    public void Drive()
    {
        if (_battery > 0)
        {
            _distance += 20;
            _battery -= 1;
        }
    }
}
