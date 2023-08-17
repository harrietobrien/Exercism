using System;

static class QuestLogic
{
    public static bool CanFastAttack(bool knightIsAwake)
    {
        return !knightIsAwake;
    }

    public static bool CanSpy(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake)
    {
        return knightIsAwake || archerIsAwake || prisonerIsAwake;
    }

    public static bool CanSignalPrisoner(bool archerIsAwake, bool prisonerIsAwake)
    {
        return prisonerIsAwake && !archerIsAwake;
    }

    public static bool CanFreePrisoner(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake, bool petDogIsPresent) {
        if (petDogIsPresent)
        {
            if (!archerIsAwake)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            if (!prisonerIsAwake)
            {
                return false;
            }
            else
            {
                if (!knightIsAwake && !archerIsAwake)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}
