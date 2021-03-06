<?php

/**
 * Created by PhpStorm.
 * User: alx
 * Date: 1/23/17
 * Time: 10:21 AM
 */
class CryptoCoinHelper
{
    public static function getCoins()
    {
        return array('bitcoin', 'litecoin', 'paycoin', 'dogecoin', 'dash', 'speedcoin', 'reddcoin', 'potcoin',
            'feathercoin', 'vertcoin', 'vericoin', 'peercoin', 'monetaryunit', 'swiscoin');
    }


    private static  $_localisation = array(
        "en" => array("name" => "English",
            /*36*/
            "button" => "Click Here if you have already sent %coinNames%",
            /*37*/
            "msg_not_received" => "<b>%coinNames% have not yet been received.</b><br>If you have already sent %coinNames% (the exact %coinName% sum in one payment as shown in the box below), please wait a few minutes to receive them by %coinName% Payment System. If you send any other sum, Payment System will ignore the transaction and you will need to send the correct sum again, or contact the site owner for assistance.",
            /*38*/
            "msg_received" => "%coinName% Payment System received %amountPaid% %coinLabel% successfully !",
            /*39*/
            "msg_received2" => "%coinName% Captcha received %amountPaid% %coinLabel% successfully !",
            /*40*/
            "payment" => "Select Payment Method",
            /*42*/
            "pay_in" => "Payment in %coinName%"),

        "es" => array("name" => "Spanish",
            "button" => "Click aqui si ya has mandado %coinNames%",
            "msg_not_received" => "<b>%coinNames% no han sido recibidos.</b><br>Si ya has enviado %coinNames% (la cantidad exacta de %coinName% en un s&oacute;lo pago como se muestra abajo), por favor espera unos minutos para recibirlas del %coinName% sistema de pagos. Si has enviado otra cantidad, el sistema de pagos ignorar&aacute; la transacci&oacute;n y necesitar&aacute;s mandar la cantidad correcta de nuevo, o contactar al propietario del sitio para recibir asistencia.",
            "msg_received" => "%coinName% Sistema de pago recibido %amountPaid% %coinLabel% satisfactoriamente !",
            "msg_received2" => "%coinName% Captcha recibido %amountPaid% %coinLabel% satisfactoriamente !",
            "payment" => "Seleccionar m&eacute;todo de pago",
            "pay_in" => "Pago en %coinName%"),

        "fr" => array("name" => "French",
            "button" => "Cliquez ici si vous avez d&eacute;j&agrave; envoy&eacute; vos %coinNames%",
            "msg_not_received" => "<b>Les %coinNames% n'ont pas encore &eacute;t&eacute; re&ccedil;us.</b><br>Si vous avez d&eacute;j&agrave; envoy&eacute; les %coinNames% (la somme exacte en un seul paiement, comme indiqu&eacute; dans le cadre ci-dessous), Veuillez s'il vous pla&icirc;t attendre quelques minutes le temps que le syst&egrave;me re&ccedil;oive votre paiement en %coinName%. Si vous envoyez toute autre somme, le syst&egrave;me de paiement n'identifiera pas la transaction et vous devrez &agrave; nouveau envoyer la somme correcte, ou contacter le propri&eacute;taire du site via l'assistance.",
            "msg_received" => "Le syst&egrave;me de paiement %coinName% a re&ccedil;u %amountPaid% %coinLabel% avec succ&egrave;s !",
            "msg_received2" => "Le %coinName% Captcha a re&ccedil;u %amountPaid% %coinLabel% avec succ&egrave;s !",
            "payment" => "S&eacute;lectionnez la m&eacute;thode de paiement",
            "pay_in" => "Paiement en %coinName%"),

        "de" => array("name" => "German",
            "button" => "Klicke hier wenn du schon %coinNames% gesendet hast",
            "msg_not_received" => "<b>%coinNames% wurden bis jetzt noch nicht empfangen.</b><br>Wenn du bereits %coinNames% gesendet hast (der exakte %coinName% Betrag f&uuml;r die Zahlung steht in der Box unten) warte bitte ein paar Minuten bis das %coinName% System die Zahlung erhalten hat. Wenn du einen anderen Betrag sendest ignoriert das System die Transaktion und du musst den korrekten Betrag erneut senden, oder den Besitzer der Website kontaktieren um Hilfe zu erhalten.",
            "msg_received" => "%coinName% Bezahlsystem hat %amountPaid% %coinLabel% erfolgreich erhalten !",
            "msg_received2" => "%coinName% Captcha hat %amountPaid% %coinLabel% erfolgreich erhalten !",
            "payment" => "Zahlungmethode ausw&auml;hlen",
            "pay_in" => "Zahlung in %coinName%"),

        "ru" => array("name" => "Russian",
            "button" => "&#1053;&#1072;&#1078;&#1084;&#1080;&#1090;&#1077; &#1079;&#1076;&#1077;&#1089;&#1100; &#1077;&#1089;&#1083;&#1080; &#1074;&#1099; &#1091;&#1078;&#1077; &#1087;&#1086;&#1089;&#1083;&#1072;&#1083;&#1080; %coinNames%",
            "msg_not_received" => "<b>%coinNames% &#1085;&#1077; &#1087;&#1086;&#1083;&#1091;&#1095;&#1077;&#1085;&#1099; &#1077;&#1097;&#1105;.</b><br>&#1045;&#1089;&#1083;&#1080; &#1074;&#1099; &#1091;&#1078;&#1077; &#1087;&#1086;&#1089;&#1083;&#1072;&#1083;&#1080; %coinNames% (&#1090;&#1086;&#1095;&#1085;&#1091;&#1102; &#1089;&#1091;&#1084;&#1084;&#1091; %coinName% &#1086;&#1076;&#1085;&#1080;&#1084; &#1087;&#1083;&#1072;&#1090;&#1077;&#1078;&#1105;&#1084; &#1082;&#1072;&#1082; &#1087;&#1086;&#1082;&#1072;&#1079;&#1072;&#1085;&#1086; &#1085;&#1080;&#1078;&#1077;), &#1087;&#1086;&#1078;&#1072;&#1083;&#1091;&#1081;&#1089;&#1090;&#1072; &#1087;&#1086;&#1076;&#1086;&#1078;&#1076;&#1080;&#1090;&#1077; &#1085;&#1077;&#1089;&#1082;&#1086;&#1083;&#1100;&#1082;&#1086; &#1084;&#1080;&#1085;&#1091;&#1090; &#1076;&#1083;&#1103; &#1087;&#1086;&#1083;&#1091;&#1095;&#1077;&#1085;&#1080;&#1103; &#1080;&#1093; %coinName% &#1087;&#1083;&#1072;&#1090;&#1105;&#1078;&#1085;&#1086;&#1081; &#1089;&#1080;&#1089;&#1090;&#1077;&#1084;&#1086;&#1081;. &#1045;&#1089;&#1083;&#1080; &#1074;&#1099; &#1087;&#1086;&#1089;&#1083;&#1072;&#1083;&#1080; &#1083;&#1102;&#1073;&#1091;&#1102; &#1076;&#1088;&#1091;&#1075;&#1091;&#1102; &#1089;&#1091;&#1084;&#1084;&#1091;, &#1087;&#1083;&#1072;&#1090;&#1105;&#1078;&#1085;&#1072;&#1103; &#1089;&#1080;&#1089;&#1090;&#1077;&#1084;&#1072; &#1073;&#1091;&#1076;&#1077;&#1090; &#1080;&#1075;&#1085;&#1086;&#1088;&#1080;&#1088;&#1086;&#1074;&#1072;&#1090;&#1100; &#1101;&#1090;&#1086; &#1080; &#1074;&#1072;&#1084; &#1085;&#1091;&#1078;&#1085;&#1086; &#1073;&#1091;&#1076;&#1077;&#1090; &#1087;&#1086;&#1089;&#1083;&#1072;&#1090;&#1100; &#1087;&#1088;&#1072;&#1074;&#1080;&#1083;&#1100;&#1085;&#1091;&#1102; &#1089;&#1091;&#1084;&#1084;&#1091; &#1086;&#1087;&#1103;&#1090;&#1100;, &#1080;&#1083;&#1080; &#1089;&#1074;&#1103;&#1078;&#1080;&#1090;&#1077;&#1089;&#1100; &#1089; &#1074;&#1083;&#1072;&#1076;&#1077;&#1083;&#1100;&#1094;&#1077;&#1084; &#1089;&#1072;&#1081;&#1090;&#1072; &#1076;&#1083;&#1103; &#1087;&#1086;&#1084;&#1086;&#1097;&#1080;",
            "msg_received" => "%coinName% &#1087;&#1083;&#1072;&#1090;&#1105;&#1078;&#1085;&#1072;&#1103; &#1089;&#1080;&#1089;&#1090;&#1077;&#1084;&#1072; &#1087;&#1086;&#1083;&#1091;&#1095;&#1080;&#1083;&#1072; %amountPaid% %coinLabel% &#1091;&#1089;&#1087;&#1077;&#1096;&#1085;&#1086; !",
            "msg_received2" => "%coinName% &#1082;&#1072;&#1087;&#1095;&#1072; &#1087;&#1086;&#1083;&#1091;&#1095;&#1080;&#1083;&#1072; %amountPaid% %coinLabel% &#1091;&#1089;&#1087;&#1077;&#1096;&#1085;&#1086; !",
            "payment" => "&#1042;&#1099;&#1073;&#1077;&#1088;&#1080;&#1090;&#1077; &#1089;&#1087;&#1086;&#1089;&#1086;&#1073; &#1086;&#1087;&#1083;&#1072;&#1090;&#1099;",
            "pay_in" => "&#1054;&#1087;&#1083;&#1072;&#1090;&#1072; &#1074; %coinName%"),

        "pl" => array("name" => "Polish",
            "button" => "Kliknij tutaj, je&#347;li ju&#380; wys&#322;ane %coinNames%",
            "msg_not_received" => "<b>%coinNames% nie zosta&#322;y jeszcze otrzymane.</b><br>Je&#347;li ju&#380; wys&#322;a&#322;e&#347; %coinNames% (dok&#322;adn&#261; sum&#281; %coinName% w jednej p&#322;atno&#347;ci, jak pokazano w poni&#380;szym polu), prosz&#281; poczeka&#263; kilka minut, aby system p&#322;atno&#347;ci %coinName% m&#243;g&#322; j&#261; otrzyma&#263;. Je&#347;li wy&#347;lesz jak&#261;kolwiek inn&#261; sum&#281;, system p&#322;atno&#347;ci zignoruje transakcje i trzeba b&#281;dzie wys&#322;a&#263; poprawn&#261; sum&#281; ponownie lub skontaktowa&#263; si&#281; z w&#322;a&#347;cicielem witryny w celu uzyskania pomocy.",
            "msg_received" => "System p&#322;atno&#347;ci %coinName% otrzyma&#322; %amountPaid% %coinLabel% pomy&#347;lnie !",
            "msg_received2" => "%coinName% Captcha otrzyma&#322; %amountPaid% %coinLabel% pomy&#347;lnie !",
            "payment" => "Wybierz metod&#281; p&#322;atno&#347;&#263;i",
            "pay_in" => "P&#322;atno&#347;&#263; w %coinName%"),

        "nl" => array("name" => "Dutch",
            "button" => "Klik hier als je al %coinNames% hebt verstuurd",
            "msg_not_received" => "<b>%coinNames% zijn nog niet ontvangen.</b><br>Als je al %coinNames% verstuurd hebt, (het exacte bedrag in %coinName% staat in het vak hieronder), wacht dan a.u.b. een paar minuten tot ze ontvangen zijn door het %coinName% Betaal Systeem. Als u een ander bedrag verstuurd, zal de transactie worden genegeerd, u zult dan alsnog het correcte bedrag moeten overmaken of contact opnemen met de site beheerder voor verdere assistentie.",
            "msg_received" => "%coinName% Betaal Systeem heeft %amountPaid% %coinLabel% succesvol ontvangen !",
            "msg_received2" => "%coinName% Captcha Systeem heeft %amountPaid% %coinLabel% succesvol ontvangen !",
            "payment" => "Kies uw betaalmethode",
            "pay_in" => "Betaling in %coinName%"),

        "pt" => array("name" => "Portuguese",
            "button" => "Se ja enviou %coinNames% clique aqui",
            "msg_not_received" => "<b>Os %coinNames% ainda n&#227;o foram recebidos.</b><br>Se j&#225; enviou %coinNames% (a soma exata de %coinName% num s&#243; pagamento, como mostrado na caixa abaixo), por favor, espere alguns minutos para o sistema de pagamentos %coinName% os receber. Se enviar qualquer outro montante, o sistema de pagamentos ir&#225; ignorar a transa&#231;&#227;o e ter&#225; que enviar a soma correta novamente; ou entre em contato com o propriet&#225;rio do site para assist&#234;ncia.",
            "msg_received" => "O sistema de pagamentos %coinName% recebeu %amountPaid% %coinLabel% com sucesso !",
            "msg_received2" => "%coinName% Captcha recebeu %amountPaid% %coinLabel% com sucesso !",
            "payment" => "Selecione o metodo de pagamento",
            "pay_in" => "Pagamento em %coinName%"),

        "fa" => array("name" => "Persian",
            "button" => "&#1575;&#1711;&#1585; &#1588;&#1605;&#1575; &#1575;&#1586; &#1602;&#1576;&#1604; &#1575;&#1585;&#1587;&#1575;&#1604; %coinName% &#1575;&#1610;&#1606;&#1580;&#1575; &#1585;&#1575; &#1705;&#1604;&#1610;&#1705; &#1705;&#1606;&#1610;&#1583;",
            "msg_not_received" => "<b>%coinNames% &#1607;&#1606;&#1608;&#1586; &#1583;&#1585;&#1610;&#1575;&#1601;&#1578; &#1606;&#1588;&#1583;&#1607; &#1575;&#1587;&#1578; </b><br> &#1575;&#1711;&#1585; &#1588;&#1605;&#1575; &#1602;&#1576;&#1604;&#1575; &#1575;&#1585;&#1587;&#1575;&#1604; &#1705;&#1585;&#1583;&#1610;&#1583; %coinNames% ,&#1576;&#1607; &#1589;&#1608;&#1585;&#1578; &#1583;&#1602;&#1610;&#1602; %coinName% &#1605;&#1580;&#1605;&#1608;&#1593; &#1583;&#1585; &#1610;&#1705; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1607;&#1605;&#1575;&#1606;&#1711;&#1608;&#1606;&#1607; &#1705;&#1607; &#1583;&#1585; &#1705;&#1575;&#1583;&#1585; &#1586;&#1610;&#1585; &#1606;&#1588;&#1575;&#1606; &#1583;&#1575;&#1583;&#1607; &#1588;&#1583;&#1607; &#1575;&#1587;&#1578; , &#1604;&#1591;&#1601;&#1575; &#1670;&#1606;&#1583; &#1583;&#1602;&#1610;&#1602;&#1607; &#1576;&#1585;&#1575;&#1610; &#1583;&#1585;&#1610;&#1575;&#1601;&#1578; &#1575;&#1586; &#1591;&#1585;&#1601; %coinName% &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1587;&#1610;&#1587;&#1578;&#1605; &#1589;&#1576;&#1585; &#1705;&#1606;&#1610;&#1583;. &#1575;&#1711;&#1585; &#1588;&#1605;&#1575; &#1607;&#1585; &#1711;&#1608;&#1606;&#1607; &#1605;&#1580;&#1605;&#1608;&#1593; &#1583;&#1610;&#1711;&#1585;&#1610; &#1575;&#1586; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1585;&#1575; &#1601;&#1585;&#1587;&#1578;&#1575;&#1583;&#1607; &#1575;&#1610;&#1583;, &#1587;&#1610;&#1587;&#1578;&#1605; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1605;&#1593;&#1575;&#1605;&#1604;&#1607; &#1585;&#1575; &#1606;&#1575;&#1583;&#1610;&#1583;&#1607; &#1605;&#1610; &#1711;&#1610;&#1585;&#1583; &#1608; &#1588;&#1605;&#1575; &#1606;&#1610;&#1575;&#1586; &#1576;&#1607; &#1575;&#1585;&#1587;&#1575;&#1604; &#1605;&#1580;&#1605;&#1608;&#1593; &#1583;&#1585;&#1587;&#1578;&#1610; &#1705;&#1607; &#1584;&#1705;&#1585; &#1588;&#1583; &#1583;&#1575;&#1585;&#1610;&#1583;, &#1610;&#1575; &#1576;&#1575; &#1583;&#1575;&#1585;&#1606;&#1583;&#1607; &#1587;&#1575;&#1610;&#1578; &#1576;&#1585;&#1575;&#1610; &#1705;&#1605;&#1705; &#1608; &#1578;&#1608;&#1590;&#1610;&#1581;&#1575;&#1578; &#1576;&#1610;&#1588;&#1578;&#1585; &#1578;&#1605;&#1575;&#1587; &#1576;&#1711;&#1610;&#1585;&#1610;&#1583;.",
            "msg_received" => "%coinName% &#1587;&#1610;&#1587;&#1578;&#1605; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; %amountPaid% %coinLabel% &#1585;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1610;&#1578; &#1583;&#1585;&#1610;&#1575;&#1601;&#1578; &#1705;&#1585;&#1583; !",
            "msg_received2" => "%coinName% &#1705;&#1662;&#1670;&#1575; %amountPaid% %coinLabel% &#1585;&#1575; &#1576;&#1575; &#1605;&#1608;&#1601;&#1602;&#1610;&#1578; &#1583;&#1585;&#1610;&#1575;&#1601;&#1578; &#1705;&#1585;&#1583; !",
            "payment" => "&#1585;&#1608;&#1588; &#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1585;&#1575; &#1575;&#1606;&#1578;&#1582;&#1575;&#1576; &#1705;&#1606;&#1610;&#1583;",
            "pay_in" => "&#1662;&#1585;&#1583;&#1575;&#1582;&#1578; &#1583;&#1585; %coinName%"),

        "ko" => array("name" => "Korean",
            "button" => "&#47564;&#50557; %coinName% &#51060;&#48120; &#48372;&#45256;&#45796;&#47732; &#50668;&#44592;&#47484; &#53364;&#47533;&#54616;&#49464;&#50836;",
            "msg_not_received" => "<b>%coinNames% &#50500;&#51649; &#48155;&#51648; &#47803;&#54664;&#49845;&#45768;&#45796;.</b><br>&#47564;&#50557; &#45817;&#49888;&#51060; &#51060;&#48120; %coinNames% &#51012; &#48372;&#45256;&#45796;&#47732; (&#50500;&#47000; &#48149;&#49828;&#50504;&#50640; &#48372;&#50668;&#51648;&#45716; &#54616;&#45208;&#51032; &#44208;&#51228; &#45236;&#50640; &#50668;&#48516;&#51032; %coinName% &#51032; &#54633;&#44228;), &#44208;&#51228; &#49884;&#49828;&#53596;&#51060; &#51652;&#54665;&#46104;&#45716; &#46041;&#50504; &#51104;&#49884;&#47564; &#44592;&#45796;&#47140;&#51452;&#49464;&#50836;. &#47564;&#50557; &#45817;&#49888;&#51060; &#54633;&#44228;&#50640; &#48372;&#50668;&#51648;&#45716; &#44163;&#44284; &#45796;&#47480; &#49688;&#47049;&#51032; &#48708;&#53944;&#53076;&#51064;&#51012; &#48372;&#45256;&#45796;&#47732;, &#44208;&#51228; &#49884;&#49828;&#53596;&#51008; &#54644;&#45817; &#44144;&#47000;&#47484; &#47924;&#49884;&#54616;&#47728;, &#45817;&#49888;&#51008; &#45796;&#49884; &#50732;&#48148;&#47480; &#54633;&#44228;&#47564;&#53372;&#51032; &#48708;&#53944;&#53076;&#51064;&#51012; &#48372;&#45236;&#44144;&#45208; &#46020;&#50880;&#51012; &#51460; &#49688; &#51080;&#45716; &#49324;&#51060;&#53944; &#44288;&#47532;&#51088;&#50640;&#44172; &#50672;&#46973;&#54644;&#50556; &#54633;&#45768;&#45796;.",
            "msg_received" => "%coinName% &#44208;&#51228; &#49884;&#49828;&#53596;&#51060; %amountPaid% %coinLabel% &#47484; &#49457;&#44277;&#51201;&#51004;&#47196; &#48155;&#50520;&#49845;&#45768;&#45796; !",
            "msg_received2" => "%coinName% &#52897;&#52320;&#44032; %amountPaid% %coinLabel% &#47484; &#49457;&#44277;&#51201;&#51004;&#47196; &#48155;&#50520;&#49845;&#45768;&#45796; !",
            "payment" => "&#44208;&#51228; &#48169;&#48277; &#49440;&#53469;",
            "pay_in" => "%coinName% &#51648;&#44553;"),

        "ja" => array("name" => "Japanese",
            "button" => "%coinNames%&#12434;&#36865;&#20449;&#28168;&#12398;&#22580;&#21512;&#12399;&#12289;&#12371;&#12385;&#12425;&#12434;&#12463;&#12522;&#12483;&#12463;&#12375;&#12390;&#12367;&#12384;&#12373;&#12356;",
            "msg_not_received" => "<b>%coinNames%&#12398;&#21463;&#21462;&#12399;&#23436;&#20102;&#12375;&#12390;&#12356;&#12414;&#12379;&#12435;&#12290;</b><br>%coinNames%&#65288;&#19979;&#35352;&#12395;&#34920;&#31034;&#12373;&#12428;&#12390;&#12356;&#12427;&#12385;&#12423;&#12358;&#12393;&#12398;%coinNames%&#12434;1&#22238;&#12398;&#12488;&#12521;&#12531;&#12470;&#12463;&#12471;&#12519;&#12531;&#12392;&#12375;&#12390;&#65289;&#12434;&#12377;&#12391;&#12395;&#36865;&#12387;&#12383;&#22580;&#21512;&#12399;&#12289;%coinName%&#27770;&#28168;&#12471;&#12473;&#12486;&#12512;&#12363;&#12425;&#25968;&#20998;&#20197;&#20869;&#12395;&#30906;&#35469;&#12364;&#12354;&#12426;&#12414;&#12377;&#12290;&#25351;&#23450;&#20197;&#19978;&#12398;%coinNames%&#12434;&#36865;&#12387;&#12383;&#22580;&#21512;&#12399;&#12289;&#12471;&#12473;&#12486;&#12512;&#12395;&#21453;&#26144;&#12373;&#12428;&#12414;&#12379;&#12435;&#12398;&#12391;&#12289;&#12418;&#12358;&#19968;&#24230;&#12420;&#12426;&#30452;&#12377;&#12363;&#12289;&#12454;&#12455;&#12502;&#12469;&#12452;&#12488;&#31649;&#29702;&#32773;&#12408;&#12362;&#21839;&#21512;&#12379;&#12367;&#12384;&#12373;&#12356;&#12290;&#19975;&#12364;&#19968;&#12289;&#36865;&#20449;&#28168;&#12415;&#12398;&#22580;&#21512;&#12399;&#12289;%coinName%&#27770;&#28168;&#12471;&#12473;&#12486;&#12512;&#12363;&#12425;&#12398;&#30906;&#35469;&#12434;&#24453;&#12387;&#12390;&#12367;&#12384;&#12373;&#12356;&#12290;",
            "msg_received" => "%coinName%&#27770;&#28168;&#12471;&#12473;&#12486;&#12512;&#12391; %amountPaid% %coinLabel% &#12398;&#27770;&#28168;&#12364;&#23436;&#20102;&#12375;&#12414;&#12375;&#12383; !",
            "msg_received2" => "%coinName%&#12461;&#12515;&#12502;&#12481;&#12515;&#12391; %amountPaid% %coinLabel% &#12398;&#27770;&#28168;&#12364;&#23436;&#20102;&#12375;&#12414;&#12375;&#12383; !",
            "payment" => "&#27770;&#28168;&#26041;&#27861;&#12434;&#36984;&#25246;",
            "pay_in" => "%coinName%&#12391;&#12398;&#27770;&#28168;"),

        "id" => array("name" => "Indonesian",
            "button" => "Klik disini jika anda telah mengirim %coinNames%",
            "msg_not_received" => "<b>%coinNames% belum diterima.</b><br>Jika kamu sudah mengirim %coinNames% (sejumlah %coinNames% dengan jumlah yang tepat seperti pada kotak dibawah),  silahkan tunggu beberapa menit untuk menerima %coinName% lewat sistem pembayaran. Jika anda mengirim sejumlah lain, sistem pembayaran akan mengabaikan transaksinya dan anda perlu mengirim dengan jumlah yang tepat lagi, atau kontak pemilik web untuk membantu.",
            "msg_received" => "%coinName% Sistem Pembayaran menerima %amountPaid% %coinLabel% dengan sukses !",
            "msg_received2" => "%coinName% Captcha menerima %amountPaid% %coinLabel% dengan sukses !",
            "payment" => "Pilih Metode Pembayaran",
            "pay_in" => "Pembayaran dalam bentuk %coinName%"),

        "ar" => array("name" => "Arabic",
            "button" => "&#1575;&#1590;&#1594;&#1591; &#1607;&#1606;&#1575; &#1601;&#1610; &#1581;&#1575;&#1604;&#1577; &#1602;&#1605;&#1578; &#1601;&#1593;&#1604;&#1575;&#1611; &#1576;&#1575;&#1604;&#1575;&#1585;&#1587;&#1575;&#1604; %coinNames%",
            "msg_not_received" => "<b>%coinNames% &#1604;&#1605; &#1610;&#1578;&#1605; &#1575;&#1587;&#1578;&#1604;&#1575;&#1605;&#1607;&#1575; &#1576;&#1593;&#1583;.</b><br> &#1573;&#1584;&#1575; &#1602;&#1605;&#1578; &#1576;&#1573;&#1585;&#1587;&#1575;&#1604;&#1607;&#1575; %coinNames% (&#1576;&#1575;&#1604;&#1592;&#1576;&#1591; %coinName% &#1605;&#1576;&#1604;&#1594; &#1601;&#1610; &#1583;&#1601;&#1593; &#1608;&#1575;&#1581;&#1583;), &#1610;&#1585;&#1580;&#1609; &#1575;&#1604;&#1573;&#1606;&#1578;&#1592;&#1575;&#1585; &#1576;&#1590;&#1593; &#1583;&#1602;&#1575;&#1574;&#1602; &#1604;&#1573;&#1587;&#1578;&#1604;&#1575;&#1605;&#1607;&#1605; &#1605;&#1606; &#1582;&#1604;&#1575;&#1604; %coinName% &#1606;&#1592;&#1575;&#1605; &#1575;&#1604;&#1583;&#1601;&#1593;. &#1573;&#1584;&#1575; &#1602;&#1605;&#1578; &#1576;&#1573;&#1585;&#1587;&#1575;&#1604; &#1605;&#1576;&#1575;&#1604;&#1594; &#1571;&#1582;&#1585;&#1609;, &#1606;&#1592;&#1575;&#1605; &#1575;&#1604;&#1583;&#1601;&#1593; &#1587;&#1608;&#1601; &#1610;&#1580;&#1575;&#1607;&#1604; &#1575;&#1604;&#1589;&#1601;&#1602;&#1577;&#1548; &#1608;&#1587;&#1608;&#1601; &#1578;&#1581;&#1578;&#1575;&#1580; &#1604;&#1573;&#1585;&#1587;&#1575;&#1604; &#1575;&#1604;&#1605;&#1576;&#1604;&#1594; &#1575;&#1604;&#1589;&#1581;&#1610;&#1581; &#1605;&#1585;&#1577; &#1571;&#1582;&#1585;&#1609;",
            "msg_received" => "%coinName% &#1578;&#1605; &#1575;&#1587;&#1578;&#1604;&#1575;&#1605; &#1575;&#1604;&#1605;&#1576;&#1604;&#1594; %amountPaid% %coinLabel% &#1576;&#1606;&#1580;&#1575;&#1581; !",
            "msg_received2" => "%coinName% &#1578;&#1605; &#1575;&#1587;&#1578;&#1604;&#1575;&#1605; &#1575;&#1604;&#1603;&#1575;&#1576;&#1578;&#1588;&#1575; %amountPaid% %coinLabel% &#1576;&#1606;&#1580;&#1575;&#1581; !",
            "payment" => "&#1575;&#1582;&#1578;&#1585; &#1591;&#1585;&#1610;&#1602;&#1577; &#1575;&#1604;&#1583;&#1601;&#1593;",
            "pay_in" => "&#1583;&#1601;&#1593; &#1601;&#1610; %coinName%"),

        "cn" => array("name" => "Chinese Simplified",
            "button" => "&#28857;&#20987;&#27492;,&#22914;&#26524;&#20320;&#24050;&#32463;&#21457;&#36865;&#20102; %coinNames%",
            "msg_not_received" => "<b>%coinNames% &#36824;&#27809;&#26377;&#25910;&#21040;&#12290;</b><br>&#22914;&#26524;&#20320;&#24050;&#32463;&#21457;&#36865; %coinNames% (&#20351;&#29992;&#20102;&#31934;&#30830;&#25968;&#37327;,&#22914;&#19979;&#26694;&#20013;&#26174;&#31034;&#30340;&#37027;&#26679;)&#65292;&#35831;&#31561;&#24453; &#20960;&#20998;&#38047;, &#31995;&#32479;&#22312;&#23436;&#25104; %coinName% &#30340;&#25509;&#25910;&#22788;&#29702;&#12290;&#22914;&#26524;&#20320;&#21457;&#36865;&#20854;&#23427;&#25968;&#37327;&#65292;&#25903;&#20184;&#31995;&#32479;&#23558;&#24573;&#30053;&#20320;&#30340;&#20132;&#26131;&#12290;&#20320;&#24517;&#39035;&#20351;&#29992;&#31934;&#30830;&#25968;&#37327;&#12290;",
            "msg_received" => "%coinName% &#25903;&#20184;&#31995;&#32479;&#25104;&#21151;&#25509;&#25910;&#20102; %amountPaid% %coinLabel% !",
            "msg_received2" => "%coinName% &#39564;&#35777;&#30721;&#24050;&#25509;&#25910;&#65292; %amountPaid% %coinLabel% &#25104;&#21151; !",
            "payment" => "&#36873;&#25321;&#20184;&#27454;&#26041;&#24335;",
            "pay_in" => "&#25903;&#20184; %coinName%"),

        "zh" => array("name" => "Chinese Traditional",
            "button" => "&#40670;&#25802;&#27492;,&#22914;&#26524;&#20320;&#24050;&#32147;&#30332;&#36865;&#20102; %coinNames%",
            "msg_not_received" => "<b>%coinNames% &#36996;&#27794;&#26377;&#25910;&#21040;&#12290;</b><br>&#22914;&#26524;&#20320;&#24050;&#32147;&#30332;&#36865; %coinNames% (&#20351;&#29992;&#20102;&#31934;&#30906;&#25976;&#37327;,&#22914;&#19979;&#26694;&#20013;&#39023;&#31034;&#30340;&#37027;&#27171;)&#65292;&#35531;&#31561;&#24453;&#24190;&#20998;&#37758;,&#31995;&#32113;&#22312;&#23436;&#25104; %coinName% &#30340;&#25509;&#25910;&#34389;&#29702;&#12290;&#22914;&#26524;&#20320;&#30332;&#36865;&#20854;&#23427;&#25976;&#37327;&#65292;&#25903;&#20184;&#31995;&#32113;&#23559;&#24573;&#30053;&#20320;&#30340;&#20132;&#26131;&#12290;&#20320;&#24517;&#38920;&#20351;&#29992;&#31934;&#30906;&#25976;&#37327;&#12290;",
            "msg_received" => "%coinName% &#25903;&#20184;&#31995;&#32113;&#25104;&#21151;&#25509;&#25910;&#20102; %amountPaid% %coinLabel% !",
            "msg_received2" => "%coinName% &#39511;&#35657;&#30908;&#24050;&#25509;&#25910;&#65292;%amountPaid% %coinLabel% &#25104;&#21151; !",
            "payment" => "&#36984;&#25799;&#20184;&#27454;&#26041;&#24335;",
            "pay_in" => "&#25903;&#20184; %coinName%"),

        "hi" => array("name" => "Hindi",
            "button" => "&#2310;&#2346; &#2346;&#2361;&#2354;&#2375; &#2360;&#2375; &#2361;&#2368; &#2349;&#2375;&#2332;&#2375; &#2361;&#2376;&#2306; &#2340;&#2379; &#2351;&#2361;&#2366;&#2306; &#2325;&#2381;&#2354;&#2367;&#2325; &#2325;&#2352;&#2375;&#2306; %coinNames%",
            "msg_not_received" => "<b>%coinNames% &#2325;&#2368; &#2309;&#2349;&#2368; &#2340;&#2325; &#2346;&#2381;&#2352;&#2366;&#2346;&#2381;&#2340; &#2344;&#2361;&#2368;&#2306; &#2325;&#2367;&#2351;&#2366; &#2327;&#2351;&#2366; &#2361;&#2376;.</b><br>&#2344;&#2368;&#2330;&#2375; &#2342;&#2367;&#2319; &#2327;&#2319; &#2348;&#2377;&#2325;&#2381;&#2360; &#2350;&#2375;&#2306; &#2342;&#2367;&#2326;&#2366;&#2351;&#2366; &#2327;&#2351;&#2366; &#2361;&#2376; &#2319;&#2325; &#2349;&#2369;&#2327;&#2340;&#2366;&#2344; &#2350;&#2375;&#2306; &#2360;&#2335;&#2368;&#2325; %coinNames% &#2352;&#2366;&#2358;&#2367; &#2351;&#2342;&#2367; &#2310;&#2346; &#2344;&#2375; &#2346;&#2361;&#2354;&#2375; &#2360;&#2375; &#2361;&#2368; %coinName% &#2349;&#2375;&#2332;&#2366; &#2361;&#2376;, &#2340;&#2379; %coinName% &#2349;&#2369;&#2327;&#2340;&#2366;&#2344; &#2346;&#2381;&#2352;&#2339;&#2366;&#2354;&#2368; &#2360;&#2375; &#2313;&#2344;&#2381;&#2361;&#2375;&#2306; &#2346;&#2381;&#2352;&#2366;&#2346;&#2381;&#2340; &#2325;&#2352;&#2344;&#2375; &#2325;&#2375; &#2354;&#2367;&#2319; &#2325;&#2369;&#2331; &#2361;&#2368; &#2350;&#2367;&#2344;&#2335;&#2379;&#2306; &#2325;&#2371;&#2346;&#2351;&#2366; &#2346;&#2381;&#2352;&#2340;&#2368;&#2325;&#2381;&#2359;&#2366; &#2325;&#2352;&#2375;&#2306;. &#2310;&#2346; &#2346;&#2361;&#2354;&#2375; &#2360;&#2375; &#2361;&#2368; &#2325;&#2367;&#2360;&#2368; &#2309;&#2344;&#2381;&#2351; &#2352;&#2366;&#2358;&#2367; &#2349;&#2375;&#2332;&#2344;&#2375; &#2325;&#2368; &#2361;&#2376;, &#2340;&#2379; &#2349;&#2369;&#2327;&#2340;&#2366;&#2344; &#2346;&#2381;&#2352;&#2339;&#2366;&#2354;&#2368; &#2354;&#2375;&#2344;-&#2342;&#2375;&#2344; &#2346;&#2352; &#2343;&#2381;&#2351;&#2366;&#2344; &#2344;&#2361;&#2368;&#2306; &#2342;&#2375;&#2327;&#2366; &#2324;&#2352; &#2310;&#2346; &#2347;&#2367;&#2352; &#2360;&#2375; &#2360;&#2361;&#2368; &#2352;&#2366;&#2358;&#2367; &#2349;&#2375;&#2332;&#2344;&#2375; &#2325;&#2368; &#2332;&#2352;&#2370;&#2352;&#2340; &#2361;&#2379;&#2327;&#2368;.",
            "msg_received" => "%coinName% &#2349;&#2369;&#2327;&#2340;&#2366;&#2344; &#2346;&#2381;&#2352;&#2339;&#2366;&#2354;&#2368; &#2346;&#2381;&#2352;&#2366;&#2346;&#2381;&#2340; %amountPaid% %coinLabel% &#2360;&#2347;&#2354;&#2340;&#2366;&#2346;&#2370;&#2352;&#2381;&#2357;&#2325; !",
            "msg_received2" => "%coinName% &#2325;&#2376;&#2346;&#2381;&#2330;&#2366; &#2346;&#2381;&#2352;&#2366;&#2346;&#2381;&#2340; %amountPaid% %coinLabel% &#2360;&#2347;&#2354;&#2340;&#2366;&#2346;&#2370;&#2352;&#2381;&#2357;&#2325; !",
            "payment" => "&#2330;&#2369;&#2344;&#2375;&#2306; &#2349;&#2369;&#2327;&#2340;&#2366;&#2344; &#2325;&#2366; &#2340;&#2352;&#2368;&#2325;&#2366;",
            "pay_in" => "%coinName% &#2350;&#2375;&#2306; &#2349;&#2369;&#2327;&#2340;&#2366;&#2344;")
    );

    public static  function get_locales(){
        return self::$_localisation;
    }
    public static function locale_signs($key){
        return self::$_localisation[$key];
    }
    public static function icrc32($str)
    {
        $in = crc32($str);
        $int_max = pow(2, 31)-1;
        if ($in > $int_max) $out = $in - $int_max * 2 - 2;
        else $out = $in;
        $out = abs($out);

        return $out;
    }

    public static function convert_currency_live($from_Currency, $to_Currency, $amount)
    {
        $amount = urlencode($amount);
        $from_Currency = trim(strtoupper(urlencode($from_Currency)));
        $to_Currency = trim(strtoupper(urlencode($to_Currency)));

        if ($from_Currency == "TRL")  $from_Currency = "TRY"; // fix for Turkish Lyra
        if ($from_Currency == "ZWD")  $from_Currency = "ZWL"; // fix for Zimbabwe Dollar
        if ($from_Currency == "RIAL") $from_Currency = "IRR"; // fix for Iranian Rial

        $url = "https://www.google.com/finance/converter?a=".$amount."&from=".$from_Currency."&to=".$to_Currency;

        $ch = curl_init();
        curl_setopt ($ch, CURLOPT_URL, $url);
        curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)");
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 20);
        curl_setopt ($ch, CURLOPT_TIMEOUT, 20);
        $rawdata = curl_exec($ch);
        curl_close($ch);
        $data = explode('bld>', $rawdata);
        $data = explode($to_Currency, $data[1]);

        return round($data[0], ($to_Currency=="BTC"?5:2));
    }

    public static  function left($str, $findme, $firstpos = true)
    {
        $pos = ($firstpos)? stripos($str, $findme) : strripos($str, $findme);

        if ($pos === false) return $str;
        else return substr($str, 0, $pos);
    }
    public static  function right($str, $findme, $firstpos = true)
    {
        $pos = ($firstpos)? stripos($str, $findme) : strripos($str, $findme);

        if ($pos === false) return $str;
        else return substr($str, $pos + strlen($findme));
    }

    public static function ip_address()
    {
        static $ip_address;

        if ($ip_address) return $ip_address;

        $server = JFactory::getApplication()->input->server;

        $ip_address         = "";
        $proxy_ips          = (defined("PROXY_IPS")) ? unserialize(PROXY_IPS) : array();  // your server internal proxy ip
        $internal_ips       = array('127.0.0.0', '127.0.0.1', '127.0.0.2', '192.0.0.0', '192.0.0.1',
            '192.168.0.0', '192.168.0.1', '192.168.0.253', '192.168.0.254', '192.168.0.255', '192.168.1.0',
            '192.168.1.1', '192.168.1.253', '192.168.1.254', '192.168.1.255', '192.168.2.0', '192.168.2.1',
            '192.168.2.253', '192.168.2.254', '192.168.2.255', '10.0.0.0', '10.0.0.1', '11.0.0.0',
            '11.0.0.1', '1.0.0.0', '1.0.1.0', '1.1.1.1', '255.0.0.0', '255.0.0.1', '255.255.255.0',
            '255.255.255.254', '255.255.255.255', '0.0.0.0', '::', '0::', '0:0:0:0:0:0:0:0');

        for ($i = 1; $i <= 2; $i++)
            if (!$ip_address)
            {
                foreach (array('HTTP_CLIENT_IP', 'HTTP_X_CLIENT_IP', 'HTTP_X_CLUSTER_CLIENT_IP', 'X-Forwarded-For',
                             'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED',
                             'HTTP_X_REAL_IP', 'REMOTE_ADDR') as $header)
                    if (!$ip_address && $server->get($header))
                    {
                        $ip  = trim($server->get($header));
                        $ip2 = "";
                        if (strpos($ip, ',') !== FALSE)
                        {
                            list($ip, $ip2) = explode(',', $ip, 2);
                            $ip = trim($ip);
                            $ip2 = trim($ip2);
                        }

                        if ($ip && filter_var($ip, FILTER_VALIDATE_IP)
                            && !in_array($ip, $proxy_ips) && ($i==2 || !in_array($ip, $internal_ips))) 				$ip_address = $ip;
                        elseif ($ip2 && filter_var($ip2, FILTER_VALIDATE_IP) && !in_array($ip2, $proxy_ips) && ($i==2 || !in_array($ip2, $internal_ips))) 		$ip_address = $ip2;
                    }
            }

        if (!$ip_address || !filter_var($ip_address, FILTER_VALIDATE_IP)) $ip_address = '0.0.0.0';

        return $ip_address;
    }

    public static function check_payment($data){
        $ch = curl_init( "https://coins.gourl.io/result.php" );
        curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt( $ch, CURLOPT_POST, 1);
        curl_setopt( $ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt( $ch, CURLOPT_HEADER, 0);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 20);
        curl_setopt( $ch, CURLOPT_TIMEOUT, 20);

        $res = curl_exec( $ch );

        if ($res) {
            $res = json_decode($res, true);
            return $res;
        }
        return false;
    }
}