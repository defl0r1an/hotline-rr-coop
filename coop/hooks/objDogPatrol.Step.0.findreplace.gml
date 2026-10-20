        if (place_meeting(x, y, objPlayer))
//@@REPLACE@@
        if (scrCoopMeleePuppet(0))
        {
            instance_destroy();
            exit;
        }
        if (place_meeting(x, y, objPlayer))
