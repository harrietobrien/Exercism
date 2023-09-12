using System;
using System.Text.RegularExpressions;

static partial class LogLine
{
    public static string Message(string logLine)
    {
        string msg = logLine.Trim();
        int colonIndex = msg.IndexOf(":") + 1;
        Console.WriteLine(msg[colonIndex..].Trim());
        return msg[colonIndex..].Trim();
    }

    public static string LogLevel(string logLine)
    {
        Regex pattern = new("\\[(.*?)\\]");
        var level = pattern.Match(logLine).Groups[1].Value;
        Console.WriteLine(level);
        return level.ToLower();
    }

    public static string Reformat(string logLine)
    {
        return string.Format("{0} ({1})", Message(logLine), LogLevel(logLine));
    }
}
