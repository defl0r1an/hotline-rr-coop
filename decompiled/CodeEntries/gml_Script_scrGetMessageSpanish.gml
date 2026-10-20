ylimit = -1;
if (global.maskindex == 19 && global.maskon == 1)
{
    scrGetMessageFrench(argument0);
}
else
{
    my_id = instance_create(x, y, objPhoneConversation);
    objEffector.image_xscale = 1.5;
    objEffector.image_yscale = 1.5;
    if (room == rmSequence1)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "¡NUEVO MENSAJE RECIBIDO!";
            my_id.line2[0] = "*BEEP*";
            my_id.line1[1] = "HOLA, HABLA 'TIM' DE LA";
            my_id.line2[1] = "PASTELERIA. LAS GALLETAS QUE";
            my_id.line1[2] = "ORDENASTE DEBERIAN DE";
            my_id.line2[2] = "HABER LLEGADO...";
            my_id.line1[3] = "UNA LISTE DE INGREDIENTES ESTA";
            my_id.line2[3] = "INCLUIDA... ¡ASEGURATE DE";
            my_id.line1[4] = "LEERLA CON MUCHA";
            my_id.line2[4] = "ATENCIÓN!";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
            global.phone = 1;
        }
        if (argument0 == 161)
        {
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            my_id.sprite = 232;
            with (objEffector)
            {
                sprite = 232;
            }
            my_id.line1[0] = "El objetivo es un portafolios.";
            my_id.line2[0] = "Ser discreto es infalible.";
            my_id.line1[1] = "Deja el objeto en el punto";
            my_id.line2[1] = "F-32, adentro del contenedor.";
            my_id.line1[2] = "Fallar no es una opciÓn.";
            my_id.line2[2] = "Te estaremos observando.";
            my_id.messages = 2;
            global.package = 1;
        }
    }
    if (room == rmSequence2)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "¡NUEVO MENSAJE RECIBIDO!";
            my_id.line2[0] = "*BEEP*";
            my_id.line1[1] = "¡HOLA!, HABLA 'LINDA'...";
            my_id.line2[1] = "NECESITO A UN NIÑERO";
            my_id.line1[2] = "DE INMEDIATO. TENGO A";
            my_id.line2[2] = "UNOS NIÑOS QUE NECESITAN";
            my_id.line1[3] = "SER DISCIPLINADOS. ESTOY";
            my_id.line2[3] = "EN EAST 7TH STREET.";
            my_id.line1[4] = "ASEGURATE DE TENER UNA";
            my_id.line2[4] = "LARGA CHARLA CON ELLOS,";
            my_id.line1[5] = "EN VERDAD NECESITO A ALGUIEN";
            my_id.line2[5] = "LE LLEGUE A ESTOS";
            my_id.line1[6] = "BANDIDOS. Y COMO LA";
            my_id.line2[6] = "ULTIMA VEZ...";
            my_id.line1[7] = "¡PORFAVOR SE DISCRETO!";
            my_id.line2[7] = "*CLICK*";
            my_id.messages = 7;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 989;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 989;
            }
            my_id.line1[0] = "¡Gracias por subscribirte";
            my_id.line2[0] = "a nuestro boletin!";
            my_id.line1[1] = "Apreciamos tu interes";
            my_id.line2[1] = "en nuestra causa.";
            my_id.line1[2] = "America es un himno.";
            my_id.line2[2] = "Debe cantarse a coro.";
            my_id.line1[3] = "-Fifty blessings";
            my_id.line2[3] = "";
            my_id.messages = 3;
        }
    }
    if (room == rmMCSequence2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "¡NUEVO MENSAJE RECIBIDO!";
            my_id.line2[0] = "*BEEP*";
            my_id.line1[1] = "HOLA, SOY 'MARK' DE";
            my_id.line2[1] = "MIAMI DROP OFF...";
            my_id.line1[2] = "PARECE QUE TE OLVIDASTE DE";
            my_id.line2[2] = "DE TU ENTREGA AYER DE NOCHE.";
            my_id.line1[3] = "HOY TENEMOS OTRO PAQUETE";
            my_id.line2[3] = "PARA TI...";
            my_id.line1[4] = "PORFAVOR LLEVALO A";
            my_id.line2[4] = "SW 107TH PLACE.";
            my_id.line1[5] = "¡NUESTROS CLIENTES NO VAN";
            my_id.line2[5] = "A SEGUIR TOLERANDO ESTO!";
            my_id.line1[6] = "...";
            my_id.line2[6] = "*CLICK*";
            my_id.messages = 6;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 989;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 989;
            }
            my_id.line1[0] = "¡Gracias por subscribirte";
            my_id.line2[0] = "a nuestro boletin!";
            my_id.line1[1] = "Apreciamos tu interes";
            my_id.line2[1] = "en nuestra causa.";
            my_id.line1[2] = "America es un himno.";
            my_id.line2[2] = "Debe cantarse a coro.";
            my_id.line1[3] = "-Fifty blessings";
            my_id.line2[3] = "";
            my_id.messages = 3;
        }
    }
    if (room == rmMCSequence3)
    {
        my_id.sprite = 1297;
        with (objEffector)
        {
            sprite = 1297;
        }
        my_id.line1[0] = "¡NUEVO MENSAJE RECIBIDO!";
        my_id.line2[0] = "*BEEP*";
        my_id.line1[1] = "HEY, HABLA 'JANE'. FUE MUY";
        my_id.line2[1] = "LINDO HABERTE VISTO DE NUEVO.";
        my_id.line1[2] = "¿QUE TE PARECE SI SALIMOS";
        my_id.line2[2] = "HOY DE NOCHE?";
        my_id.line1[3] = "RECOGEME EN NE 158TH ST";
        my_id.line2[3] = "CERCA DE LAS 9, OKAY?";
        my_id.line1[4] = "Y PONTE UNO DE ESOS";
        my_id.line2[4] = "TRAJES QUE TIENES";
        my_id.line1[5] = "¡ME VAS A LLEVAR A UN LUGAR";
        my_id.line2[5] = "ELEGANTE!";
        my_id.line1[6] = "...";
        my_id.line2[6] = "*CLICK*";
        my_id.messages = 6;
        global.done = 1;
    }
    if (room == rmMCSequence4)
    {
        my_id.sprite = 1297;
        with (objEffector)
        {
            sprite = 1297;
        }
        my_id.line1[0] = "¡NUEVO MENSAJE RECIBIDO!";
        my_id.line2[0] = "*BEEP*";
        my_id.line1[1] = "HEY, HABLA 'BEN' DE MIAMI";
        my_id.line2[1] = "FUNERAL PARLOUR...";
        my_id.line1[2] = "TE LLAMO PARA DECIRTE QUE";
        my_id.line2[2] = "QUE LLEGARON LAS LAPIDAS";
        my_id.line1[3] = "QUE HABIAS ORDENADO Y ESTAN";
        my_id.line2[3] = "LISTAS PARA SERTE ENVIADAS.";
        my_id.line1[4] = "CON UN POCO DE SUERTE";
        my_id.line2[4] = "DEBERIAS DE TENERLAS";
        my_id.line1[5] = "ANTES DEL FIN DE SEMANA.";
        my_id.line2[5] = "...";
        my_id.line1[6] = "...";
        my_id.line2[6] = "*CLICK*";
        my_id.messages = 6;
        global.done = 1;
    }
    if (room == rmSequence14)
    {
        my_id.sprite = 977;
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        with (objEffector)
        {
            sprite = 977;
        }
        my_id.line1[0] = "...SOSPECHOSOS AFIRMAN";
        my_id.line2[0] = "HABER SIDO FORZADOS A...";
        my_id.line1[1] = "...E INSTRUIDOS A MATAR POR";
        my_id.line2[1] = "MENSAJES EN SUS...";
        my_id.line1[2] = "...LLAMADAS RASTREADAS A UN";
        my_id.line2[2] = "CLUB EN SOUTH 86TH STREET...";
        my_id.line1[3] = "...CON VINCULOS A UNA RED";
        my_id.line2[3] = "CRIMINAL DE LA MAFIA RUSA...";
        my_id.line1[4] = "...SE HAN REPORTADO VARIAS";
        my_id.line2[4] = "OCURRENCIAS DE ACTIVIDAD ILEGAL...";
        my_id.line1[5] = "...FALTA EVIDENCIA PARA";
        my_id.line2[5] = "GARANTIZAR UN ARRESTO...";
        my_id.messages = 5;
        global.done = 1;
    }
    if (room == rmHighballer)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 763;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 763;
            }
            my_id.line1[0] = "...OH AMO DE LA OSCURIDAD, DANOS";
            my_id.line2[0] = "A NOSOTROS TU ETERNO PODER...";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1623;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 1623;
            }
            my_id.line1[0] = "HEY BRANDON?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "ESCUCHASTE ALGO?";
            my_id.line2[1] = "";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 763;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 763;
            }
            my_id.line1[0] = "¡CIERRA LA BOCA, WILEY!";
            my_id.line2[0] = "¡NO MIENTRAS CANTO!";
            my_id.messages = 0;
        }
    }
    if (room == rmSecretSewer)
    {
        my_id.sprite = 856;
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        with (objEffector)
        {
            sprite = 856;
        }
        my_id.line1[0] = "HEY... *TOS*";
        my_id.line2[0] = "CREO QUE POR FIN LO ENTIENDO...";
        my_id.line1[1] = "TODO... TODO ESTO.";
        my_id.line2[1] = "TODO LO QUE PASO.";
        my_id.line1[2] = "SOLO ES UN SUEÑO.";
        my_id.line2[2] = "... ¿VERDAD?";
        my_id.line1[3] = "TODO ESTO ES SOLO UN";
        my_id.line2[3] = "MAL SUEÑO, ¿VERDAD?";
        my_id.line1[4] = "...";
        my_id.line2[4] = "*TOS*";
        my_id.line1[5] = "LO SABÍA...";
        my_id.line2[5] = "*TOS*";
        my_id.messages = 5;
    }
    if (room == rmJanitors)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 880;
            my_id.indexspeed = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 880;
            }
            my_id.line1[0] = "...";
            my_id.line2[0] = "";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            if (global.gotbeaten == 1)
            {
                my_id.sprite = 238;
            }
            else
            {
                my_id.sprite = 243;
            }
            my_id.indexspeed = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            if (global.gotbeaten == 1)
            {
                with (objEffector)
                {
                    sprite = 243;
                }
            }
            else
            {
                with (objEffector)
                {
                    sprite = 238;
                }
            }
            my_id.line1[0] = "(...)";
            my_id.line2[0] = "";
            my_id.line1[1] = "(¿Que es esto?";
            my_id.line2[1] = "...)";
            my_id.line1[2] = "(Parece que necesito una contraseña";
            my_id.line2[2] = "para acceder a esta computadora.)";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            if (global.gotbeaten == 1)
            {
                my_id.sprite = 243;
            }
            else
            {
                my_id.sprite = 238;
            }
            my_id.indexspeed = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            if (global.gotbeaten == 1)
            {
                with (objEffector)
                {
                    sprite = 243;
                }
            }
            else
            {
                with (objEffector)
                {
                    sprite = 238;
                }
            }
            my_id.line1[0] = "(...)";
            my_id.line2[0] = "";
            my_id.line1[1] = "(¿Que es esto?";
            my_id.line2[1] = "...)";
            my_id.line1[2] = "(Parece que necesito una contraseña";
            my_id.line2[2] = "para acceder a esta computadora.)";
            my_id.line1[3] = "(...)";
            my_id.line2[3] = "";
            my_id.line1[4] = "(¡Probemos algo!)";
            my_id.line2[4] = "";
            my_id.line1[5] = "(Ah, ¡ahi va!)";
            my_id.line2[5] = "";
            my_id.line1[6] = "(...)";
            my_id.line2[6] = "";
            my_id.line1[7] = "(Ya veo...";
            my_id.line2[7] = "Con que ese es tu juego, huh?)";
            my_id.messages = 7;
        }
    }
    if (room == rmPhoneHomUpstairsBiker)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 805;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 805;
            }
            my_id.line1[0] = "¡ALEJESE DE MI!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "¡SEGURIDAD! ¡SEGURIDAD!";
            my_id.line2[1] = "...";
            my_id.line1[2] = "MIRE... SEÑOR...";
            my_id.line2[2] = "¡PORFAVOR NO ME MÁTE!";
            my_id.line1[3] = "PORFAVOR...";
            my_id.line2[3] = "¡HARE LO QUE SEA!";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "¡VETE DE ACA AHORA MISMO";
            my_id.line2[0] = "SI NO QUIERES MORIR!";
            my_id.line1[1] = "...";
            my_id.line2[1] = "";
            my_id.line1[2] = "OKAY, ¡TU LO PEDISTE!";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "(...)";
            my_id.line2[0] = "";
            my_id.line1[1] = "(INTERESANTE";
            my_id.line2[1] = "...)";
            my_id.line1[2] = "(NORTH 87TH PLACE, HUH?)";
            my_id.line2[2] = "";
            my_id.line1[3] = "(ASI QUE AHI TE HAS ESTADO";
            my_id.line2[3] = "ESCONDIENDO...)";
            my_id.messages = 3;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "TUVISTE TU OPORTUNIDAD";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 240;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 241;
            }
            my_id.line1[0] = "¡HIJO DE PUTA!";
            my_id.line2[0] = "";
            my_id.line1[1] = "...";
            my_id.line2[1] = "";
            my_id.messages = 1;
        }
    }
    if (room == rmMCBar)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "¿CREES QUE SOY ESTUPIDO?";
            my_id.line2[0] = "¿HUH? ¿ME VES CARA DE ESTUPIDO?";
            my_id.line1[1] = "SE QUE NO ME ESTAS CONTANDO";
            my_id.line2[1] = "TODO LO QUE SABES...";
            my_id.line1[2] = "¡TU ME METISTE EN ESTA";
            my_id.line2[2] = "PORQUERIA!";
            my_id.line1[3] = "ME DIJISTE QUE SERIA";
            my_id.line2[3] = "EMOCIONANTE, ¿O ACASO ME EQUIVOCO?";
            my_id.line1[4] = "PUES ADIVINA QUE, ¡ESTO ES UNA MIERDA!";
            my_id.line2[4] = "ESTOY ABURRIDO, ¡ME CANSÉ!";
            my_id.line1[5] = "¡QUIERO SALIR DE ESTO! ¡Y TU";
            my_id.line2[5] = "ME VAS A DECIRE COMO!";
            my_id.line1[6] = "ESTA ESTUPIDEZ SE ACABA";
            my_id.line2[6] = "AHORA MISMO, ¿!¿ME OLLÉS?!?";
            my_id.messages = 6;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 648;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 648;
            }
            my_id.line1[0] = "¡BUENO, BUENO!";
            my_id.line2[0] = "¡CÁLMATE!";
            my_id.line1[1] = "¡NO TIENE NI IDEA DE LOS";
            my_id.line2[1] = "PROBLEMAS QUE ME VAS A DAR!";
            my_id.line1[2] = "*SIGH*";
            my_id.line2[2] = "...";
            my_id.line1[3] = "HAY UN TIPO ESCONDIENDOSE";
            my_id.line2[3] = "EN 'THE BLUE DRAGON'...";
            my_id.line1[4] = "UN RESTAURANTE CHINO";
            my_id.line2[4] = "EN EL CENTRO. EL SABE MAS QUE YO.";
            my_id.line1[5] = "SOLO NO LE DIGAS MI NOMBRE";
            my_id.line2[5] = "A NADIE, ¿OKAY?";
            my_id.line1[6] = "¡SOY HOMBRE MUERTO DE";
            my_id.line2[6] = "CUALQUIER MANERA! ...";
            my_id.messages = 6;
        }
    }
    if (room == rmNoodleShop)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 238;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 238;
            }
            my_id.line1[0] = "¡ESCUCHAME, BASURA! HAY";
            my_id.line2[0] = "ALGUNAS COSAS QUE DEBO SABER.";
            my_id.line1[1] = "MAS TE VALE QUE RESPONDAS";
            my_id.line2[1] = "A MIS PREGUNTAS, ¿ENTENDIDO?";
            my_id.line1[2] = "¿QUIENES SON LAS PERSONAS";
            my_id.line2[2] = "QUE ME ESTAN DEJANDO MENSAJES?";
            my_id.line1[3] = "Y QUE NI SE TE OCCURA";
            my_id.line2[3] = "MENTIRME, ¿ME OYÉS?";
            my_id.line1[4] = "¡NO TENGO NINGUN PROBLEMA CON";
            my_id.line2[4] = "DESPEDAZARTE SI DEBO!";
            my_id.messages = 4;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1502;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 1502;
            }
            my_id.line1[0] = "¡TE DIRE LO QUE SE!";
            my_id.line2[0] = "¡POR FAVOR NO ME LASTIMES!";
            my_id.line1[1] = "NO PUEDO DECIRTE QUIENES SON";
            my_id.line2[1] = "LOS QUE ESTAN DETRAS DE ESTO...";
            my_id.line1[2] = "PERO ESTAN USANDO PHONEHOM";
            my_id.line2[2] = "PARA LAVARSE LAS MANOS.";
            my_id.line1[3] = "SOLO LOS AYUDE A CONFIGURAR";
            my_id.line2[3] = "EL PROXY EN LA ESTACIÓN.";
            my_id.line1[4] = "VAS A TENER QUE HACKEAR EL";
            my_id.line2[4] = "SISTEMA PARA RASTREARLOS.";
            my_id.line1[5] = "FUI A ESCONDERME TAN PRONTO";
            my_id.line2[5] = "TERMINÉ MI TRABAJO.";
            my_id.line1[6] = "PARECE QUE TIENEN UNA AGENDA";
            my_id.line2[6] = "POLITICA O ALGO ASI...";
            my_id.line1[7] = "¡CASI ME DA ALGO!";
            my_id.line2[7] = "...";
            my_id.line1[8] = "¡GASTÉ TODOS MIS AHORROS EN";
            my_id.line2[8] = "CONSEGUIR ESTE LUGAR!";
            my_id.line1[9] = "¡ES TODO LO QUE TENGO!";
            my_id.line2[9] = "...";
            my_id.messages = 9;
        }
    }
    if (room == rmSequence10)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "¡NUEVO MENSAJE RECIVIDO!";
            my_id.line2[0] = "*BEEP*";
            my_id.line1[1] = "Habla 'Rick' de";
            my_id.line2[1] = "bienes raíces.";
            my_id.line1[2] = "Hay una visita a un";
            my_id.line2[2] = "apartamento en el centro hoy.";
            my_id.line1[3] = "Esta ubicado en SW 121st Street,";
            my_id.line2[3] = "Apt 35.";
            my_id.line1[4] = "Puedes pasar por ahi cuando";
            my_id.line2[4] = "tengas tiempo.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
            global.done = 1;
        }
    }
    if (room == rmSequence4)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "Hey, habla 'Kate' del servicio";
            my_id.line2[0] = "de citas 'Hotline Miami'.";
            my_id.line1[1] = "Hemos arreglado una cita";
            my_id.line2[1] = "para ti esta noche.";
            my_id.line1[2] = "ELLA TE ESTARA ESPERANDO";
            my_id.line2[2] = "EN SOUTHWEST 53rd PLACE.";
            my_id.line1[3] = "Como siempre, asegurate";
            my_id.line2[3] = "de vestir algo elegante.";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*CLICK*";
            my_id.messages = 4;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...OTRA MASACRE HA SIDO";
            my_id.line2[0] = "REPORTADA EN NW 184th St...";
            my_id.line1[1] = "...CADENA DE VIOLENCIA POR";
            my_id.line2[1] = "CRIMINALES EN TODA MIAMI...";
            my_id.messages = 1;
        }
    }
    if (room == rmSequence5)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "¡Buenas noches!";
            my_id.line2[0] = "Te ésta hablando 'Blake'";
            my_id.line1[1] = "Tenemos un trabajo para ti.";
            my_id.line2[1] = "Hubo un corte de luz...";
            my_id.line1[2] = "En 24th NE St. Necesitamos";
            my_id.line2[2] = "que te encargues de esto.";
            my_id.line1[3] = "Habiamos enviado a otra";
            my_id.line2[3] = "persona ahi...";
            my_id.line1[4] = "Pero resulta que no";
            my_id.line2[4] = "hizo un buen trabajo.";
            my_id.line1[5] = "¡Pasa por ahi de inmediato!";
            my_id.line2[5] = "Te estan esperando.";
            my_id.line1[6] = "¡Y haz tu trabajo eficazmente!";
            my_id.line2[6] = "*CLICK*";
            my_id.messages = 6;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...PRODUCTOR DE PELICULAS";
            my_id.line2[0] = "ENCONTRADO MUERTO EN SU MANSIÓN...";
            my_id.line1[1] = "...CAMARAS DE SEGURIDAD REVELAN";
            my_id.line2[1] = "A UN PERPETRADOR ENMASCARDO...";
            my_id.line1[2] = "...MUJER NO IDENTIFICADA FUE";
            my_id.line2[2] = "SECUESTRADA EN LA ESCENA...";
            my_id.messages = 2;
        }
    }
    if (room == rmSequence7Downstairs)
    {
        my_id.sprite = 880;
        my_id.indexspeed = 0;
        with (objEffector)
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite = 880;
        }
        my_id.line1[0] = "...";
        my_id.line2[0] = "";
        my_id.messages = 0;
    }
    if (room == rmHotelSuite)
    {
        my_id.sprite = 1147;
        my_id.indexspeed = 0;
        with (objEffector)
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite = 1147;
        }
        my_id.line1[0] = "...";
        my_id.line2[0] = "";
        my_id.messages = 0;
    }
    if (room == rmSequence6)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "HABLA 'DAVE' DE MIAMI PEST";
            my_id.line2[0] = "CONTROL. TE NECESITAMOS.";
            my_id.line1[1] = "UN CLIENTE EN SW 104th STREET";
            my_id.line2[1] = "TIENE PROBLEMAS CON INSECTOS.";
            my_id.line1[2] = "TRATA LA SITUACION TAN RAPIDO";
            my_id.line2[2] = "Y EFICAZ COMO PUEDAS.";
            my_id.line1[3] = "ALGUIEN LIMPIARA POR";
            my_id.line2[3] = "TI DESPUES DE QUE TE VAYAS.";
            my_id.line1[4] = "Asegurate de no molestar";
            my_id.line2[4] = "a ningun vecino.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...EXPLOSION DE BOMBA ESCUCHADA";
            my_id.line2[0] = "EN TODO EL CENTRO...";
            my_id.line1[1] = "...SE DESCONOCE LAS CONSEQUENCIAS.";
            my_id.line2[1] = "RESTOS DESTRUIDOS...";
            my_id.line1[2] = "...VARIOS SOSPECHOSOS ENMASCARADOS";
            my_id.line2[2] = "VISTOS EN...";
            my_id.messages = 2;
        }
    }
    if (room == rmSequence7)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "Hola, habla 'Don' del Hotel";
            my_id.line2[0] = "Blue, te necesitamos esta noche!";
            my_id.line1[1] = "Nuestro recepcionista se fue a";
            my_id.line2[1] = "casa por dolor abdominal...";
            my_id.line1[2] = "¡Y tenemos a varios VIPs que";
            my_id.line2[2] = "se quedaran con nosotros hoy!";
            my_id.line1[3] = "Asegurate de darles una";
            my_id.line2[3] = "buena estadia...";
            my_id.line1[4] = "¡Esa sera tu prioridad";
            my_id.line2[4] = "esta noche!";
            my_id.line1[5] = "¡Apresurate!";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...ASESINATOS POR ENMASCARADOS CONTINUAN.";
            my_id.line2[0] = "DOCENA DE CUERPOS ENCONTRADOS...";
            my_id.line1[1] = "...CONNEXIONES CON LA";
            my_id.line2[1] = "MAFIA RUSA LOCAL PREDECIBLES...";
            my_id.line1[2] = "...LA POLICIE DENIEGA RUMORES";
            my_id.line2[2] = "DE UN MOVIMIENTO VIGILANTE....";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...ALCALDE DE MIAMI SUGIERE";
            my_id.line2[0] = "TOQUE DE QUEDA...";
            my_id.line1[1] = "...'ESTAMOS EN BASICAMENTE";
            my_id.line2[1] = "UN ESTADO DE EMERGENCIA'...";
            my_id.messages = 1;
        }
    }
    if (room == rmSequence8)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "Habla 'Harry' de la administración.";
            my_id.line2[0] = "¡Tenemos un problema!";
            my_id.line1[1] = "Hubo un desaster en los";
            my_id.line2[1] = "condominios en 122nd SE st!";
            my_id.line1[2] = "One of the residents' water";
            my_id.line2[2] = "pipe burst, wet all over!";
            my_id.line1[3] = "The whole building is gonna";
            my_id.line2[3] = "be flooded soon...";
            my_id.line1[4] = "Hope you can get on this";
            my_id.line2[4] = "shit ASAP... Don't go easy";
            my_id.line1[5] = "on the mop!";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...TIROTEO EN EL HOTEL BLUE";
            my_id.line2[0] = "LA NOCHE ANTERIOR...";
            my_id.line1[1] = "...TRES POLITICOS";
            my_id.line2[1] = "ASESINADOS...";
            my_id.line1[2] = "...GRAVES REPERCUSIONES PARA";
            my_id.line2[2] = "LA COALISION RUSO-AMERICANA...";
            my_id.line1[3] = "...VICTIMAS CON VINCULOS";
            my_id.line2[3] = "A RED CRIMINAL...";
            my_id.messages = 3;
        }
    }
    if (room == rmSequence3)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "YOU HAVE ONE NEW MESSAGE!";
            my_id.line2[0] = "*BEEP*";
            my_id.line1[1] = "This is 'Thomas' from the";
            my_id.line2[1] = "methadone clinic.";
            my_id.line1[2] = "We've scheduled a short";
            my_id.line2[2] = "meeting for you tonight.";
            my_id.line1[3] = "We're at NW 184th Street,";
            my_id.line2[3] = "Apt 105. And don't worry...";
            my_id.line1[4] = "We know discretion is of";
            my_id.line2[4] = "importance to our clients.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...SIX BODIES FOUND ON";
            my_id.line2[0] = "East 7th St...";
            my_id.line1[1] = "...POLICE SUSPECTS TIES TO";
            my_id.line2[1] = "ILLEGAL DRUG TRADE...";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 842;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 842;
            }
            my_id.line1[0] = "...WITNESS CLAIMS SEEING";
            my_id.line2[0] = "MONSTER LEAVING THE SCENE...";
            my_id.messages = 0;
        }
    }
    if (room == rmSequence11)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "Hello there, this is 'Thomas'";
            my_id.line2[0] = "from the 'DOWNTOWN RELAXATION'.";
            my_id.line1[1] = "We need you to fill in at";
            my_id.line2[1] = "the reception tonight.";
            my_id.line1[2] = "One of our employees has";
            my_id.line2[2] = "'called in sick'.";
            my_id.line1[3] = "Wear something fitting";
            my_id.line2[3] = "and discreet.";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*CLICK*";
            my_id.messages = 4;
            global.done = 1;
        }
    }
    if (room == rmSequence9)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "Hi, it's 'Pat' from The Club.";
            my_id.line2[0] = "We want you to DJ tonight.";
            my_id.line1[1] = "YOU'RE FREE TO PLAY ANY";
            my_id.line2[1] = "KIND OF MUSIC YOU WANT.";
            my_id.line1[2] = "BEER IS ON THE HOUSE!";
            my_id.line2[2] = "";
            my_id.line1[3] = "We're on 212 NE 24th Street.";
            my_id.line2[3] = "Dress to kill! See ya...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*CLICK*";
            my_id.messages = 4;
            global.done = 1;
        }
    }
    if (room == rmSequence12)
    {
        if (argument0 == 369)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "This is 'Jim' from the";
            my_id.line2[0] = "'office'... *AHEM*";
            my_id.line1[1] = "Just wanted to remind you";
            my_id.line2[1] = "that your 'report' is due";
            my_id.line1[2] = "tomorrow morning. Have it";
            my_id.line2[2] = "on my desk by eight.";
            my_id.line1[3] = "312 SE st. is the address,";
            my_id.line2[3] = "in case you forgot...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "*CLICK*";
            my_id.line1[5] = "*CLICK*";
            my_id.line2[5] = "*CLICK-CLICK*";
            my_id.line1[6] = "*CLICK* *CLICK*";
            my_id.line2[6] = "*CLICK*";
            my_id.line1[7] = "...";
            my_id.line2[7] = "";
            my_id.line1[8] = "*CLICK* *CLICK* *CLICK*";
            my_id.line2[8] = "*CLICK* *CLICK* *CLICK*";
            my_id.line1[9] = "...";
            my_id.line2[9] = "*CLICK*";
            my_id.messages = 9;
            global.done = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 514;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 514;
            }
            my_id.line1[0] = "Get out of my face,";
            my_id.line2[0] = "asshole!";
            my_id.line1[1] = "*Cough*";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
    }
    if (room == rmSequence12b)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 617;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "Ah, there you are!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "I was wondering when";
            my_id.line2[1] = "you'd be getting back.";
            my_id.line1[2] = "Well, let's get this";
            my_id.line2[2] = "over with then...";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1004;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1004;
            }
            my_id.line1[0] = "...";
            my_id.line2[0] = "";
            my_id.messages = 0;
        }
    }
    if (room == rmOfficeEntrance)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 720;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 720;
            }
            if (argument0 == 0)
            {
                my_id.line1[0] = "I give up! You win!";
                my_id.line2[0] = "...";
                my_id.messages = 0;
            }
        }
    }
    if (room == rmDream1)
    {
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        if (argument0 == 0)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "AND WHO DO WE HAVE HERE?";
            my_id.line2[0] = "";
            my_id.line1[1] = "OH, YOU DON'T KNOW";
            my_id.line2[1] = "WHO YOU ARE..?";
            my_id.line1[2] = "MAYBE WE SHOULD LEAVE";
            my_id.line2[2] = "IT THAT WAY?";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "BUT I KNOW YOU.";
            my_id.line2[0] = "";
            my_id.line1[1] = "Look at my face.";
            my_id.line2[1] = "WE'VE MET BEFORE...";
            my_id.line1[2] = "HAVEN'T WE?";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 318;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 255)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 318;
            }
            my_id.line1[0] = "I don't know you!";
            my_id.line2[0] = "";
            my_id.line1[1] = "Why are you here?";
            my_id.line2[1] = "";
            my_id.line1[2] = "You're no guest";
            my_id.line2[2] = "of mine!";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "Do you really want me to";
            my_id.line2[0] = "reveal who you are?";
            my_id.line1[1] = "Knowing oneself means";
            my_id.line2[1] = "acknowledging ones actions.";
            my_id.line1[2] = "As of lately you've done ";
            my_id.line2[2] = "some terrible things...";
            my_id.messages = 2;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "You don't remember me?";
            my_id.line2[0] = "I'll give you a clue...";
            my_id.line1[1] = "Does April the 3rd mean";
            my_id.line2[1] = "anything to you?";
            my_id.line1[2] = "I believe that was the day";
            my_id.line2[2] = "of our first encounter.";
            my_id.line1[3] = "You look like you might be";
            my_id.line2[3] = "remembering something...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "";
            my_id.messages = 4;
        }
    }
    if (room == rmDream2)
    {
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        if (argument0 == 0)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "Oh, it's you again...";
            my_id.line2[0] = "";
            my_id.line1[1] = "It looks like you've been";
            my_id.line2[1] = "busy since we last met.";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "I see that you remember me";
            my_id.line2[0] = "now. Don't you?";
            my_id.line1[1] = "But you still don't know";
            my_id.line2[1] = "who I am.";
            my_id.line1[2] = "You don't even know who";
            my_id.line2[2] = "introduced us, do you?";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 318;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 255)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 318;
            }
            my_id.line1[0] = "Why did you come back here?";
            my_id.line2[0] = "";
            my_id.line1[1] = "You're not a nice person, ";
            my_id.line2[1] = "are you?";
            my_id.line1[2] = "You make me sick!";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "A picture is starting to";
            my_id.line2[0] = "take form here...";
            my_id.line1[1] = "I wonder if it's accurate.";
            my_id.line2[1] = "";
            my_id.line1[2] = "Some pieces don't quite";
            my_id.line2[2] = "seem to fit.";
            my_id.line1[3] = "Or maybe I just don't";
            my_id.line2[3] = "like the way it looks.";
            my_id.messages = 3;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "I think our time is up...";
            my_id.line2[0] = "But we'll meet again.";
            my_id.line1[1] = "Before you go, here's";
            my_id.line2[1] = "four questions to ponder.";
            my_id.line1[2] = "Question number one:";
            my_id.line2[2] = "";
            my_id.line1[3] = "Do you like hurting other";
            my_id.line2[3] = "people?";
            my_id.line1[4] = "Question number two:";
            my_id.line2[4] = "";
            my_id.line1[5] = "Who is leaving messages";
            my_id.line2[5] = "on your answering machine?";
            my_id.line1[6] = "Question number three:";
            my_id.line2[6] = "";
            my_id.line1[7] = "Where are you right now?";
            my_id.line2[7] = "";
            my_id.line1[8] = "And the final question:";
            my_id.line2[8] = "";
            my_id.line1[9] = "Why are we having this";
            my_id.line2[9] = "conversation?";
            my_id.line1[10] = "That's all for now.";
            my_id.line2[10] = "See you soon...";
            my_id.messages = 10;
        }
    }
    if (room == rmDream3)
    {
        objEffector.image_xscale = 2;
        objEffector.image_yscale = 2;
        if (argument0 == 0)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "So, you came back?";
            my_id.line2[0] = "";
            my_id.line1[1] = "How are you feeling?";
            my_id.line2[1] = "You look ill...";
            my_id.line1[2] = "Maybe you should see";
            my_id.line2[2] = "a doctor?";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 318;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 255)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 318;
            }
            my_id.line1[0] = "I told you not to come";
            my_id.line2[0] = "back here!";
            my_id.line1[1] = "I see that my opinion of";
            my_id.line2[1] = "you doesn't matter...";
            my_id.line1[2] = "If you insist on returning";
            my_id.line2[2] = "here, then I should leave!";
            my_id.messages = 2;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "Have you thought about";
            my_id.line2[0] = "what I asked you last time?";
            my_id.line1[1] = "I'm not here to give you";
            my_id.line2[1] = "any answers...";
            my_id.line1[2] = "Questions are all I have";
            my_id.line2[2] = "to offer a man like you.";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 317;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 16776960)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 317;
            }
            my_id.line1[0] = "If you're not feeling well,";
            my_id.line2[0] = "maybe you should rest?";
            my_id.line1[1] = "Some things work out best";
            my_id.line2[1] = "when you don't try so hard.";
            my_id.line1[2] = "No matter who you are,";
            my_id.line2[2] = "Bearing too much weight...";
            my_id.line1[3] = "inevitably leads to the";
            my_id.line2[3] = "collapse of everything.";
            my_id.messages = 3;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 316;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objLight)
            {
                if (color == 65535)
                {
                    targetstrength = 1;
                }
                else
                {
                    targetstrength = 0;
                }
            }
            with (objEffector)
            {
                sprite = 316;
            }
            my_id.line1[0] = "Next time we meet will";
            my_id.line2[0] = "be the last. ";
            my_id.line1[1] = "I can see it in your eyes.";
            my_id.line2[1] = "";
            my_id.line1[2] = "Before you go I'll leave you";
            my_id.line2[2] = "with three predictions...";
            my_id.line1[3] = "'Someone you know is not";
            my_id.line2[3] = "who you think he is.'";
            my_id.line1[4] = "'Something will soon be";
            my_id.line2[4] = "taken from you.'";
            my_id.line1[5] = "'On July the 21st you will";
            my_id.line2[5] = "wake up in a bigger house.'";
            my_id.line1[6] = "That is all.";
            my_id.line2[6] = "...";
            my_id.messages = 6;
        }
    }
    if (room == rmSequence12c)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 315;
            my_id.index = 0;
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            with (objEffector)
            {
                sprite = 315;
            }
            my_id.line1[0] = "Looks like it's only";
            my_id.line2[0] = "you and me left now...";
            my_id.line1[1] = "I'm sure you know by now,";
            my_id.line2[1] = "that this won't end well.";
            my_id.line1[2] = "Soon you will be all alone.";
            my_id.line2[2] = "But that's okay.";
            my_id.line1[3] = "Before we say goodbye, I'll";
            my_id.line2[3] = "let you in on a secret...";
            my_id.line1[4] = "What you do from here on,";
            my_id.line2[4] = "won't serve any purpose.";
            my_id.line1[5] = "You will never see the";
            my_id.line2[5] = "whole picture...";
            my_id.line1[6] = "And it's all your own fault.";
            my_id.line2[6] = "...";
            my_id.line1[7] = "Now it's time for ";
            my_id.line2[7] = "you to leave.";
            my_id.line1[8] = "There's a warm bed across";
            my_id.line2[8] = "the hall from here...";
            my_id.line1[9] = "And you look like you";
            my_id.line2[9] = "could use some rest.";
            my_id.messages = 9;
        }
    }
    if (room == rmBuildingFloor4)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1806;
            my_id.index = 0;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "THERE'S BEEN A SMALL";
            my_id.line2[0] = "CHANGE OF PLANS...";
            my_id.line1[1] = "WE HAVE A PRANK CALLER";
            my_id.line2[1] = "AT THE TELEPHONE COMPANY.";
            my_id.line1[2] = "WHY DON'T YOU GO THERE";
            my_id.line2[2] = "AND SEE IF YOU CAN...";
            my_id.line1[3] = "'TALK SOME SENSE' WITH HIM.";
            my_id.line2[3] = "YOU KNOW WHAT I MEAN.";
            my_id.line1[4] = "342nd NW ST. GO THERE";
            my_id.line2[4] = "NOW! FLOOR IT.";
            my_id.line1[5] = "...";
            my_id.line2[5] = "*CLICK*";
            my_id.messages = 5;
        }
    }
    if (room == rmPhoneHomUpstairs)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 238;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 238;
            }
            my_id.line1[0] = "YOU'RE DEAD MEAT";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 240;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 240;
            }
            my_id.line1[0] = "THIS... THIS CAN'T BE";
            my_id.line2[0] = "HAPPENING...";
            my_id.line1[1] = "IT CAN'T END NOW.";
            my_id.line2[1] = "NOT LIKE THIS...";
            my_id.line1[2] = "...";
            my_id.line2[2] = "*COUGH*";
            my_id.messages = 2;
        }
    }
    if (room == rmBossClubFloor3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 835;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 835;
            }
            my_id.line1[0] = "Look man, I don't want";
            my_id.line2[0] = "no trouble here...";
            my_id.line1[1] = "The safe is open, just take";
            my_id.line2[1] = "what you want and go.";
            my_id.line1[2] = "...";
            my_id.line2[2] = "";
            my_id.line1[3] = "LOOK, I'M NOT THE OWNER,";
            my_id.line2[3] = "HE'S NOT HERE...";
            my_id.line1[4] = "I JUST RUN THE CLUB!";
            my_id.line2[4] = "LET'S BE CIVIL ABOUT THIS!";
            my_id.messages = 4;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 837;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 837;
            }
            my_id.line1[0] = "ALRIGHT! ALRIGHT! ";
            my_id.line2[0] = "I'LL GIVE YOU HIS ADDRESS!";
            my_id.line1[1] = "JUST... PLEASE DON'T";
            my_id.line2[1] = "HURT ME, OK?";
            my_id.line1[2] = "HE'S ON NE 114TH PLACE.";
            my_id.line2[2] = "PLEASE JUST GO NOW, OK?";
            my_id.messages = 2;
        }
    }
    if (room == rmStore1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1230;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "Hi there, man! ";
            my_id.line2[0] = "Haven't seen you around.";
            my_id.line1[1] = "Thought something might";
            my_id.line2[1] = "have happened to you.";
            my_id.line1[2] = "You seemed really down over";
            my_id.line2[2] = "losing your girlfriend.";
            my_id.line1[3] = "Don't remember seeing";
            my_id.line2[3] = "you after that...";
            my_id.line1[4] = "...";
            my_id.line2[4] = "";
            my_id.line1[5] = "Maybe we should talk";
            my_id.line2[5] = "about something else...";
            my_id.line1[6] = "So, out for a midnight";
            my_id.line2[6] = "snack, huh?";
            my_id.line1[7] = "Oh, don't worry about it.";
            my_id.line2[7] = "It's on the house...";
            my_id.line1[8] = "Good to see you!";
            my_id.line2[8] = "Have a nice night!";
            my_id.messages = 8;
        }
    }
    if (room == rmPizzaHut1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1232;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1232;
            }
            my_id.line1[0] = "Hi there, welcome!";
            my_id.line2[0] = "";
            my_id.line1[1] = "Oh, you don't need to order,";
            my_id.line2[1] = "your pizza's already done.";
            my_id.line1[2] = "Had a feelin you were on";
            my_id.line2[2] = "your way here, heh...";
            my_id.line1[3] = "Well, let's just leave it at";
            my_id.line2[3] = "that for now, shall we?";
            my_id.line1[4] = "Don't worry about paying,";
            my_id.line2[4] = "it's on the house!";
            my_id.messages = 4;
        }
    }
    if (room == rmVideoStore1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1239;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1239;
            }
            my_id.line1[0] = "Hey dude!";
            my_id.line2[0] = "Good to see you again!";
            my_id.line1[1] = "Did you hear about the";
            my_id.line2[1] = "'massacre' the other night?";
            my_id.line1[2] = "A bunch of ruskies I heard.";
            my_id.line2[2] = "No loss, if you ask me!";
            my_id.line1[3] = "They say some maniac wearing";
            my_id.line2[3] = "a rubber mask did it!";
            my_id.line1[4] = "Sounds like a scene straight";
            my_id.line2[4] = "from a slasher flick, heh!";
            my_id.line1[5] = "Oh yeah, I have the perfect";
            my_id.line2[5] = "film for you!";
            my_id.line1[6] = "The one on the desk...";
            my_id.line2[6] = "Take it! It's on the house.";
            my_id.line1[7] = "Enjoy yourself, dude!";
            my_id.line2[7] = "";
            my_id.messages = 7;
        }
    }
    if (room == rmBar1)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1228;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1228;
            }
            my_id.line1[0] = "Hi there, welcome!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "You don't look well, sir.";
            my_id.line2[1] = "Are you alright?";
            my_id.line1[2] = "Are you sure it is ok for";
            my_id.line2[2] = "you to be drinking?";
            my_id.line1[3] = "Alright... Then I will get";
            my_id.line2[3] = "you something special.";
            my_id.line1[4] = "Do you like sweet or sour?";
            my_id.line2[4] = "Maybe you want it bitter?";
            my_id.line1[5] = "I think I know what you";
            my_id.line2[5] = "want... One moment.";
            my_id.messages = 5;
        }
    }
    if (room == rmTutorial)
    {
        if (global.xbox == 1)
        {
            if (argument0 == 0)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "I'm here to tell you how";
                my_id.line2[0] = "to kill people.";
                my_id.line1[1] = "This game is controlled with";
                my_id.line2[1] = "the analog thumbsticks.";
                my_id.line1[2] = "Press the right trigger";
                my_id.line2[2] = "to punch. Aim for the face!";
                my_id.line1[3] = "Once you've knocked someone";
                my_id.line2[3] = "out you have to finish him!";
                my_id.line1[4] = "To do this you press the";
                my_id.line2[4] = "[A] button. You got it? ";
                my_id.line1[5] = "Right trigger to punch!";
                my_id.line2[5] = "[A] button to finish!";
                my_id.line1[6] = "Do you understand me?";
                my_id.line2[6] = "Don't mess this up!";
                my_id.messages = 6;
            }
            if (argument0 == 2)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Alright, now you should try";
                my_id.line2[0] = "killing the next guy.";
                my_id.line1[1] = "But use the bat in the";
                my_id.line2[1] = "red room over here, ok?";
                my_id.line1[2] = "Press the left trigger";
                my_id.line2[2] = "when next to it to take it.";
                my_id.line1[3] = "Then you press the right";
                my_id.line2[3] = "trigger to swing it!";
                my_id.line1[4] = "Did that get through your";
                my_id.line2[4] = "thick skull? Did it?";
                my_id.line1[5] = "Left trigger to pick up!";
                my_id.line2[5] = "Right trigger to swing it!";
                my_id.line1[6] = "Are you even listening?";
                my_id.line2[6] = "Well get to it then!";
                my_id.messages = 6;
            }
            if (argument0 == 4)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Well done! so let's get";
                my_id.line2[0] = "to the guns, shall we?";
                my_id.line1[1] = "You go and get the shotgun";
                my_id.line2[1] = "in the blue room.";
                my_id.line1[2] = "You do it the same way you";
                my_id.line2[2] = "picked up the bat...";
                my_id.line1[3] = "Just press the left trigger,";
                my_id.line2[3] = "can you handle that?";
                my_id.line1[4] = "Use the left button to look ";
                my_id.line2[4] = "for enemies out of view!";
                my_id.line1[5] = "It is very useful for not";
                my_id.line2[5] = "getting yourself killed!";
                my_id.line1[6] = "You can press the right thumb";
                my_id.line2[6] = "stick to lock on to enemies.";
                my_id.line1[7] = "Just make sure to place your";
                my_id.line2[7] = "crosshair close to them first!";
                my_id.line1[8] = "Left trigger to grab!";
                my_id.line2[8] = "Press the left button to look!";
                my_id.line1[9] = "Right trigger to shoot! Press";
                my_id.line2[9] = "the right stick to lock on!";
                my_id.line1[10] = "Now go ahead and kill the";
                my_id.line2[10] = "guy in the yellow room!";
                my_id.messages = 10;
            }
            if (argument0 == 7)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Alright, that about sums";
                my_id.line2[0] = "up the basics. However...";
                my_id.line1[1] = "There's always more tricks";
                my_id.line2[1] = "to learn!";
                my_id.line1[2] = "You can throw any weapon";
                my_id.line2[2] = "you pick up...";
                my_id.line1[3] = "By pressing your left";
                my_id.line2[3] = "trigger.";
                my_id.line1[4] = "You can use doors to";
                my_id.line2[4] = "knock enemies over.";
                my_id.line1[5] = "Guns are very loud, and will";
                my_id.line2[5] = "alert your foes.";
                my_id.line1[6] = "So plan your moves and use";
                my_id.line2[6] = "melee weapons when you can.";
                my_id.line1[7] = "Goddamn it, you'll just get";
                my_id.line2[7] = "yourself killed anyway...";
                my_id.line1[8] = "Won't you?";
                my_id.line2[8] = "...";
                my_id.messages = 8;
            }
        }
        else
        {
            if (argument0 == 0)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "I'm here to tell you how";
                my_id.line2[0] = "to kill people.";
                my_id.line1[1] = "This game is controlled with";
                upkey = global.upkey;
                downkey = global.downkey;
                leftkey = global.leftkey;
                rightkey = global.rightkey;
                upkey = string_replace(upkey, "&", "arrow");
                upkey = string_replace(upkey, "%", "");
                upkey = string_replace(upkey, "'", "");
                upkey = string_replace(upkey, "(", "");
                downkey = string_replace(downkey, "&", "");
                downkey = string_replace(downkey, "%", "");
                downkey = string_replace(downkey, "'", "");
                downkey = string_replace(downkey, "(", "");
                leftkey = string_replace(leftkey, "&", "");
                leftkey = string_replace(leftkey, "%", "");
                leftkey = string_replace(leftkey, "'", "");
                leftkey = string_replace(leftkey, "(", "");
                rightkey = string_replace(rightkey, "&", "");
                rightkey = string_replace(rightkey, "%", "");
                rightkey = string_replace(rightkey, "'", "");
                rightkey = string_replace(rightkey, "(", "");
                my_id.line2[1] = "your " + upkey + leftkey + downkey + rightkey + "-keys and MOUSE.";
                my_id.line1[2] = "Press the left mouse button";
                my_id.line2[2] = "to punch. Aim for the face!";
                my_id.line1[3] = "Once you've knocked someone";
                my_id.line2[3] = "out you have to finish him!";
                my_id.line1[4] = "To do this you press space.";
                my_id.line2[4] = "You got it? Are you sure?";
                my_id.line1[5] = "Left mouse button to punch!";
                my_id.line2[5] = "Space to finish!";
                my_id.line1[6] = "Do you understand me?";
                my_id.line2[6] = "Don't mess this up!";
                my_id.messages = 6;
            }
            if (argument0 == 2)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Alright, now you should try";
                my_id.line2[0] = "killing the next guy.";
                my_id.line1[1] = "But use the bat in the";
                my_id.line2[1] = "red room over here, ok?";
                my_id.line1[2] = "Press the right mouse button";
                my_id.line2[2] = "when next to it to take it.";
                my_id.line1[3] = "Then you press the left";
                my_id.line2[3] = "mouse button to swing it!";
                my_id.line1[4] = "Did that get through your";
                my_id.line2[4] = "thick skull? Did it?";
                my_id.line1[5] = "Right mouse to pick up!";
                my_id.line2[5] = "Left mouse to swing it!";
                my_id.line1[6] = "Are you even listening?";
                my_id.line2[6] = "Well get to it then!";
                my_id.messages = 6;
            }
            if (argument0 == 4)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Well done! so let's get";
                my_id.line2[0] = "to the guns, shall we?";
                my_id.line1[1] = "You go and get the shotgun";
                my_id.line2[1] = "in the blue room.";
                my_id.line1[2] = "You do it the same way you";
                my_id.line2[2] = "picked up the bat...";
                my_id.line1[3] = "Just press the right mouse";
                my_id.line2[3] = "button, can you handle that?";
                my_id.line1[4] = "Use the shift button to look ";
                my_id.line2[4] = "for enemies out of view!";
                my_id.line1[5] = "It is very useful for not";
                my_id.line2[5] = "getting yourself killed!";
                my_id.line1[6] = "You can press the scroll";
                my_id.line2[6] = "wheel to lock on to enemies.";
                my_id.line1[7] = "Just make sure to place your";
                my_id.line2[7] = "crosshair over them first!";
                my_id.line1[8] = "Right mouse button to grab!";
                my_id.line2[8] = "Shift to look!";
                my_id.line1[9] = "Left mouse button to shoot!";
                my_id.line2[9] = "Scroll wheel to lock on!";
                my_id.line1[10] = "Now go ahead and kill the";
                my_id.line2[10] = "guy in the yellow room!";
                my_id.messages = 10;
            }
            if (argument0 == 7)
            {
                my_id.sprite = 1049;
                my_id.index = 0;
                with (objEffector)
                {
                    image_xscale = 2;
                    image_yscale = 2;
                    sprite = 1049;
                }
                my_id.line1[0] = "Alright, that about sums";
                my_id.line2[0] = "up the basics. However...";
                my_id.line1[1] = "There's always more tricks";
                my_id.line2[1] = "to learn!";
                my_id.line1[2] = "You can throw any weapon";
                my_id.line2[2] = "you pick up...";
                my_id.line1[3] = "By pressing your right";
                my_id.line2[3] = "mouse button.";
                my_id.line1[4] = "You can use doors to";
                my_id.line2[4] = "knock enemies over.";
                my_id.line1[5] = "Guns are very loud, and will";
                my_id.line2[5] = "alert your foes.";
                my_id.line1[6] = "So plan your moves and use";
                my_id.line2[6] = "melee weapons when you can.";
                my_id.line1[7] = "Goddamn it, you'll just get";
                my_id.line2[7] = "yourself killed anyway...";
                my_id.line1[8] = "Won't you?";
                my_id.line2[8] = "...";
                my_id.messages = 8;
            }
        }
    }
    if (room == rmPoliceHQFloor3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 813;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 813;
            }
            my_id.line1[0] = "Ok, boys! The bastard will";
            my_id.line2[0] = "be here any second now.";
            my_id.line1[1] = "It's time for us to show";
            my_id.line2[1] = "him what we're made of...";
            my_id.line1[2] = "Remember your training,";
            my_id.line2[2] = "and play it safe!";
            my_id.line1[3] = "Follow protocol and we'll";
            my_id.line2[3] = "all make it out alive.";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 617;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "YOU GOTTA BE SHITTING ME!";
            my_id.line2[0] = "WHY ARE YOU..?";
            my_id.line1[1] = "...";
            my_id.line2[1] = "Look, man...";
            my_id.line1[2] = "I'm sorry about your girl.";
            my_id.line2[2] = "It wasn't anything personal.";
            my_id.line1[3] = "I know you made it all the";
            my_id.line2[3] = "way here but...";
            my_id.line1[4] = "I think you're in for a";
            my_id.line2[4] = "disappointment.";
            my_id.line1[5] = "I don't really have any";
            my_id.line2[5] = "answers for you.";
            my_id.messages = 5;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 617;
            my_id.index = 1;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 615;
            }
            my_id.line1[0] = "Damn, that hurt.";
            my_id.line2[0] = "... *Cough*";
            my_id.line1[1] = "You know, we might not be";
            my_id.line2[1] = "that different you and I.";
            my_id.line1[2] = "Have you also been getting";
            my_id.line2[2] = "those weird phonecalls?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*COUGH*";
            my_id.line1[4] = "I wish I had something to";
            my_id.line2[4] = "tell you... But I don't.";
            my_id.line1[5] = "The police might know more";
            my_id.line2[5] = "about this mess than I do.";
            my_id.line1[6] = "They should have a file on";
            my_id.line2[6] = "the case here somewhere.";
            my_id.line1[7] = "I'd ask you to spare my";
            my_id.line2[7] = "life, but... *Cough*";
            my_id.line1[8] = "You look like you've made";
            my_id.line2[8] = "up your mind...";
            my_id.messages = 8;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 617;
            my_id.index = 2;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "Damn, that hurt.";
            my_id.line2[0] = "... *Cough*";
            my_id.line1[1] = "You know, I think we might not";
            my_id.line2[1] = "be that different you and I.";
            my_id.line1[2] = "Have you also been getting";
            my_id.line2[2] = "those weird phonecalls?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*COUGH*";
            my_id.line1[4] = "I wish I had something to";
            my_id.line2[4] = "tell you... But I don't.";
            my_id.line1[5] = "The police seem to know more";
            my_id.line2[5] = "about this mess than I do.";
            my_id.line1[6] = "They probably have a file on";
            my_id.line2[6] = "the case around here somewhere.";
            my_id.line1[7] = "I'd ask you to spare my life,";
            my_id.line2[7] = "but... *Cough*";
            my_id.line1[8] = "You look like you've made up";
            my_id.line2[8] = "your mind...";
            my_id.messages = 8;
        }
    }
    if (room == rmPoliceHQFloor3TigerHard)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 813;
            }
            my_id.line1[0] = "Ok, boys! The bastard will";
            my_id.line2[0] = "be here any second now.";
            my_id.line1[1] = "It's time for us to show";
            my_id.line2[1] = "him what we're made of...";
            my_id.line1[2] = "Remember your training,";
            my_id.line2[2] = "and play it safe!";
            my_id.line1[3] = "Follow protocol and we'll";
            my_id.line2[3] = "all make it out alive.";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 617;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "YOU GOTTA BE SHITTING ME!";
            my_id.line2[0] = "WHY ARE YOU..?";
            my_id.line1[1] = "...";
            my_id.line2[1] = "Look, man...";
            my_id.line1[2] = "I'm sorry about your girl.";
            my_id.line2[2] = "It wasn't anything personal.";
            my_id.line1[3] = "I know you made it all the";
            my_id.line2[3] = "way here but...";
            my_id.line1[4] = "I think you're in for a";
            my_id.line2[4] = "disappointment.";
            my_id.line1[5] = "I don't really have any";
            my_id.line2[5] = "answers for you.";
            my_id.messages = 5;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 617;
            my_id.index = 1;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 615;
            }
            my_id.line1[0] = "Damn, that hurt.";
            my_id.line2[0] = "... *Cough*";
            my_id.line1[1] = "You know, we might not be";
            my_id.line2[1] = "that different you and I.";
            my_id.line1[2] = "Have you also been getting";
            my_id.line2[2] = "those weird phonecalls?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*COUGH*";
            my_id.line1[4] = "I wish I had something to";
            my_id.line2[4] = "tell you... But I don't.";
            my_id.line1[5] = "The police might know more";
            my_id.line2[5] = "about this mess than I do.";
            my_id.line1[6] = "They should have a file on";
            my_id.line2[6] = "the case here somewhere.";
            my_id.line1[7] = "I'd ask you to spare my";
            my_id.line2[7] = "life, but... *Cough*";
            my_id.line1[8] = "You look like you've made";
            my_id.line2[8] = "up your mind...";
            my_id.messages = 8;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 617;
            my_id.index = 2;
            with (objFiles)
            {
                on = 1;
            }
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 617;
            }
            my_id.line1[0] = "Damn, that hurt.";
            my_id.line2[0] = "... *Cough*";
            my_id.line1[1] = "You know, I think we might not";
            my_id.line2[1] = "be that different you and I.";
            my_id.line1[2] = "Have you also been getting";
            my_id.line2[2] = "those weird phonecalls?";
            my_id.line1[3] = "...";
            my_id.line2[3] = "*COUGH*";
            my_id.line1[4] = "I wish I had something to";
            my_id.line2[4] = "tell you... But I don't.";
            my_id.line1[5] = "The police seem to know more";
            my_id.line2[5] = "about this mess than I do.";
            my_id.line1[6] = "They probably have a file on";
            my_id.line2[6] = "the case around here somewhere.";
            my_id.line1[7] = "I'd ask you to spare my life,";
            my_id.line2[7] = "but... *Cough*";
            my_id.line1[8] = "You look like you've made up";
            my_id.line2[8] = "your mind...";
            my_id.messages = 8;
        }
    }
    if (room == rmStore2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "Oh, hi there!";
            my_id.line2[0] = "Good to see you!";
            my_id.line1[1] = "I was a bit worried";
            my_id.line2[1] = "about you...";
            my_id.line1[2] = "The city streets don't seem";
            my_id.line2[2] = "so safe anymore, y'know?";
            my_id.line1[3] = "What with all the killings";
            my_id.line2[3] = "and all that I mean.";
            my_id.line1[4] = "Don't worry about paying.";
            my_id.line2[4] = "You're my friend...";
            my_id.line1[5] = "Your money's no good here.";
            my_id.line2[5] = "Now have a nice night!";
            my_id.messages = 5;
        }
    }
    if (room == rmPizzaHut2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1232;
            my_id.index = 1;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1232;
            }
            my_id.line1[0] = "Good evening!";
            my_id.line2[0] = "How are you doing?";
            my_id.line1[1] = "You look a bit distracted,";
            my_id.line2[1] = "something got you worried?";
            my_id.line1[2] = "These are harsh times we're";
            my_id.line2[2] = "living in, I know.";
            my_id.line1[3] = "Haven't seen many customers";
            my_id.line2[3] = "lately...";
            my_id.line1[4] = "Maybe they've lost their";
            my_id.line2[4] = "taste for pizza...";
            my_id.line1[5] = "Maybe it's time to close";
            my_id.line2[5] = "shop once and for all.";
            my_id.line1[6] = "Anyway, got your order";
            my_id.line2[6] = "right here.";
            my_id.line1[7] = "Take care now!";
            my_id.line2[7] = "";
            my_id.messages = 7;
        }
    }
    if (room == rmAlley)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1049;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1049;
            }
            my_id.line1[0] = "Who's there? I can hear";
            my_id.line2[0] = "you! I know you're there!";
            my_id.messages = 0;
        }
    }
    if (room == rmHospitalTopFloor || room == rmHospitalEntrance)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "Hey! Hold it right there!";
            my_id.line2[0] = "You're not allowed out here.";
            my_id.line1[1] = "Get back to your room, now!";
            my_id.line2[1] = "Before I call security!";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "Hey! Where do you think";
            my_id.line2[0] = "you're going, prick?";
            my_id.line1[1] = "I guess we better put";
            my_id.line2[1] = "restraints on you!";
            my_id.messages = 1;
        }
    }
    if (room == rmHospitalCutscene)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "Hey, doc! When's this";
            my_id.line2[0] = "bastard going to wake up?";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "I don't know... He's been";
            my_id.line2[0] = "in a coma for weeks now.";
            my_id.messages = 0;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "But he is going to";
            my_id.line2[0] = "wake up... right?";
            my_id.line1[1] = "This guy is a prime suspect";
            my_id.line2[1] = "in a major case!";
            my_id.messages = 1;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "Look, my guess is as good";
            my_id.line2[0] = "as yours!";
            my_id.line1[1] = "Though I can say that it";
            my_id.line2[1] = "might be a while. *sigh*";
            my_id.line1[2] = "He's still not even fully";
            my_id.line2[2] = "healed from the surgery...";
            my_id.messages = 2;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 1356;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1356;
            }
            my_id.line1[0] = "Is there nothing you can";
            my_id.line2[0] = "do? We need this guy!";
            my_id.line1[1] = "You people weren't able to";
            my_id.line2[1] = "save his girlfriend...";
            my_id.line1[2] = "I mean, we've got the perp";
            my_id.line2[2] = "who shot 'em in the locker.";
            my_id.line1[3] = "But that asshole ain't";
            my_id.line2[3] = "saying shit!";
            my_id.messages = 3;
        }
        if (argument0 == 5)
        {
            my_id.sprite = 895;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 895;
            }
            my_id.line1[0] = "And what makes you think";
            my_id.line2[0] = "this guy will..?";
            my_id.messages = 0;
        }
    }
    if (room == rmVideoStore2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1239;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1239;
            }
            my_id.line1[0] = "Hey, my man!";
            my_id.line2[0] = "Boy, am I glad to see you!";
            my_id.line1[1] = "Have you been following the";
            my_id.line2[1] = "news? About the killings?";
            my_id.line1[2] = "Now this is top secret!";
            my_id.line2[2] = "You can't tell anyone...";
            my_id.line1[3] = "But I have a friend who's";
            my_id.line2[3] = "in the police force.";
            my_id.line1[4] = "He told me there's rumours";
            my_id.line2[4] = "going around...";
            my_id.line1[5] = "There could be more than one";
            my_id.line2[5] = "perp! Maybe a whole bunch!";
            my_id.line1[6] = "A group of people wearing";
            my_id.line2[6] = "masks killing russians!";
            my_id.line1[7] = "It's like it's from a movie";
            my_id.line2[7] = "or something, right?";
            my_id.line1[8] = "Well, I think it's";
            my_id.line2[8] = "fascinating!";
            my_id.line1[9] = "Right... So just grab any";
            my_id.line2[9] = "movie you want!";
            my_id.line1[10] = "It's on the house! That's";
            my_id.line2[10] = "what friends are for!";
            my_id.messages = 10;
        }
    }
    if (room == rmBar2)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1228;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1228;
            }
            my_id.line1[0] = "Welcome back, sir!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "How are you tonight?";
            my_id.line2[1] = "You don't look so happy.";
            my_id.line1[2] = "To be honest, I don't feel";
            my_id.line2[2] = "too good either.";
            my_id.line1[3] = "Something in the air...";
            my_id.line2[3] = "I don't know...";
            my_id.line1[4] = "I just have this really";
            my_id.line2[4] = "bad feeling. Like...";
            my_id.line1[5] = "Like something terrible";
            my_id.line2[5] = "has happened tonight.";
            my_id.line1[6] = "I haven't felt this way";
            my_id.line2[6] = "since San Francisco...";
            my_id.line1[7] = "I don't like it.";
            my_id.line2[7] = "Not one bit.";
            my_id.line1[8] = "So, how about a drink?";
            my_id.line2[8] = "It's on me.";
            my_id.messages = 8;
        }
    }
    if (room == rmStore3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "Hey, man! I gotta tell ya";
            my_id.line2[0] = "something important...";
            my_id.line1[1] = "This... All of this is";
            my_id.line2[1] = "not really happening.";
            my_id.line1[2] = "Take a look...";
            my_id.line2[2] = "";
            my_id.messages = 2;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 239;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 239;
            }
            my_id.line1[0] = "*GURGLE* *GURGLE*";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "What you saw just now,";
            my_id.line2[0] = "did not actually happen.";
            my_id.line1[1] = "You don't look like you";
            my_id.line2[1] = "believe me...";
            my_id.line1[2] = "Then, allow me to";
            my_id.line2[2] = "demonstrate!";
            my_id.messages = 2;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 1236;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1236;
            }
            my_id.line1[0] = "Hey man! Nice to see";
            my_id.line2[0] = "you...";
            my_id.line1[1] = "Friendly faces are few and";
            my_id.line2[1] = "far between these days.";
            my_id.line1[2] = "Just take what you";
            my_id.line2[2] = "want, my treat.";
            my_id.line1[3] = "Have a good night, man!";
            my_id.line2[3] = "See ya!";
            my_id.messages = 3;
        }
    }
    if (room == rmPizzaHut3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 614;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 614;
            }
            my_id.line1[0] = "What do you want?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "Could you hurry up?";
            my_id.line2[1] = "We're closing soon.";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 899;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 899;
            }
            my_id.line1[0] = "We don't like strangers";
            my_id.line2[0] = "around here...";
            my_id.line1[1] = "Ain't that right, parker?";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 904;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 904;
            }
            my_id.line1[0] = "GHRRRURRR!";
            my_id.line2[0] = "";
            my_id.messages = 0;
        }
    }
    if (room == rmVideoStore3)
    {
        my_id.sprite = 614;
        my_id.index = 0;
        with (objEffector)
        {
            image_xscale = 2;
            image_yscale = 2;
            sprite = 614;
        }
        if (argument0 == 0)
        {
            my_id.line1[0] = "What're you looking at?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "Hey... I recognize you!";
            my_id.line2[1] = "You look very familiar!";
            my_id.line1[2] = "Have we met before?";
            my_id.line2[2] = "...";
            my_id.messages = 2;
        }
    }
    if (room == rmBar3)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 614;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 614;
            }
            my_id.line1[0] = "Hey you!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "VIPS only tonight!";
            my_id.line2[1] = "I think you better leave.";
            my_id.messages = 1;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 874;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 874;
            }
            my_id.line1[0] = "What the fuck are ";
            my_id.line2[0] = "you looking at?";
            my_id.line1[1] = "*Cough*";
            my_id.line2[1] = "...";
            my_id.messages = 1;
        }
    }
    if (room == rmMansionMainHall)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 727;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 727;
            }
            my_id.line1[0] = "AND WHO DO WE HAVE HERE?";
            my_id.line2[0] = "...";
            my_id.line1[1] = "YOU MUST BE ONE OF THE";
            my_id.line2[1] = "ASSHOLES KILLING OFF MY MEN.";
            my_id.line1[2] = "DOESN'T LOOK LIKE YOU";
            my_id.line2[2] = "ARE HERE TO CHAT...";
            my_id.line1[3] = "SO WHY DON'T WE GET";
            my_id.line2[3] = "THIS OVER WITH?";
            my_id.messages = 3;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 727;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 727;
            }
            my_id.line1[0] = "I GUESS IT'S JUST YOU";
            my_id.line2[0] = "AND ME LEFT NOW.";
            my_id.line1[1] = "NOT BAD!";
            my_id.line2[1] = "I'M IMPRESSED";
            my_id.line1[2] = "I WONDER WHAT GAVE YOU";
            my_id.line2[2] = "THIS THIRST FOR BLOOD.";
            my_id.line1[3] = "I'VE NEVER SEEN";
            my_id.line2[3] = "ANYTHING QUITE LIKE IT!";
            my_id.line1[4] = "NOW I WANT TO SEE WHO'S";
            my_id.line2[4] = "HIDING BEHIND THAT MASK!";
            my_id.messages = 4;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 685;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 685;
            }
            my_id.line1[0] = "LEAVE HIM TO ME";
            my_id.line2[0] = "...";
            my_id.messages = 0;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 725;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 725;
            }
            my_id.line1[0] = "I CAN SEE WHERE THIS";
            my_id.line2[0] = "IS GOING... HEH!*";
            my_id.line1[1] = "I'LL SPARE YOU";
            my_id.line2[1] = "THE PLEASURE!";
            my_id.messages = 1;
        }
        if (argument0 == 4)
        {
            my_id.sprite = 1297;
            with (objEffector)
            {
                sprite = 1297;
            }
            my_id.line1[0] = "HELLO...? HELLO?!";
            my_id.line2[0] = "...";
            my_id.line1[1] = "WHAT'S GOING ON DOWN THERE?";
            my_id.line2[1] = "I'M TRYING TO SLEEP!";
            my_id.line1[2] = "...";
            my_id.line2[2] = "";
            my_id.line1[3] = "IS THERE ANYONE THERE?";
            my_id.line2[3] = "CAN YOU HEAR ME? HELLO?";
            my_id.line1[4] = "...";
            my_id.line2[4] = "";
            my_id.line1[5] = "GODDAMN PHONES! I FUCKING";
            my_id.line2[5] = "HATE THESE THINGS!";
            my_id.line1[6] = "...";
            my_id.line2[6] = "*CLICK*";
            my_id.messages = 6;
            global.done = 1;
        }
    }
    if (room == rmMansionBalcony)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 1263;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1263;
            }
            my_id.line1[0] = "AH, SO YOU'RE THE ONE";
            my_id.line2[0] = "CAUSING THE RUCKUS?";
            my_id.line1[1] = "WHAT'S YOUR BUSINESS HERE?";
            my_id.line2[1] = "... *COUGH*";
            my_id.line1[2] = "ACTUALLY... WHY DON'T WE";
            my_id.line2[2] = "SKIP THE DETAILS?";
            my_id.line1[3] = "I'VE DONE SO MANY";
            my_id.line2[3] = "HORRIBLE THINGS...";
            my_id.line1[4] = "NOTHING SEEMS TO REALLY";
            my_id.line2[4] = "MATTER ANYMORE, DOES IT?";
            my_id.line1[5] = "I'M NOT GOING ANYWHERE,";
            my_id.line2[5] = "AS YOU CAN SEE...";
            my_id.line1[6] = "JUST GO AHEAD AND DO WHAT";
            my_id.line2[6] = "EVER YOU CAME HERE TO DO.";
            my_id.messages = 6;
        }
    }
    if (room == rmHouse1Downstairs)
    {
        if (argument0 == 0)
        {
            my_id.sprite = 663;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 663;
            }
            my_id.line1[0] = "GOTTA DO EVERYTHING BY";
            my_id.line2[0] = "MYSELF, HUH...";
            my_id.messages = 0;
        }
        if (argument0 == 1)
        {
            my_id.sprite = 664;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 664;
            }
            my_id.line1[0] = "OH GOD... *COUGH*";
            my_id.line2[0] = "PLEASE, DON'T!";
            my_id.messages = 0;
        }
        if (argument0 == 2)
        {
            my_id.sprite = 1007;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1007;
            }
            my_id.line1[0] = "HEY... ASSHOLE...";
            my_id.line2[0] = "YOU CAN'T JUST...";
            my_id.line1[1] = "*COUGH* LEAVE ME";
            my_id.line2[1] = "HERE...";
            my_id.line1[2] = "I'VE GOT NO WHERE";
            my_id.line2[2] = "TO GO...";
            my_id.line1[3] = "WHY DON'T YOU FINISH";
            my_id.line2[3] = "WHAT YOU'VE STARTED?";
            my_id.messages = 3;
        }
        if (argument0 == 3)
        {
            my_id.sprite = 1007;
            my_id.index = 0;
            with (objEffector)
            {
                image_xscale = 2;
                image_yscale = 2;
                sprite = 1007;
            }
            my_id.line1[0] = "YEAH... JUST GET IT";
            my_id.line2[0] = "OVER WITH...";
            my_id.line1[1] = "I KNEW IT WOULD END";
            my_id.line2[1] = "LIKE THIS *COUGH*";
            my_id.messages = 1;
        }
    }
}
