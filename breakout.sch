<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(2:0)" />
        <signal name="XLXN_4(9:0)" />
        <signal name="XLXN_5(8:0)" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="XLXN_12(53:0)" />
        <signal name="XLXN_13(9:0)" />
        <signal name="XLXN_14(8:0)" />
        <signal name="XLXN_15(9:0)" />
        <signal name="RESET" />
        <signal name="XLXN_28" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38" />
        <signal name="VGA_R(2:0)" />
        <signal name="VGA_G(2:0)" />
        <signal name="VGA_B(2:1)" />
        <signal name="CLK_12MHz" />
        <signal name="XLXN_49" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="PL_LEFT" />
        <signal name="PL_RIGHT" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="RESET" />
        <port polarity="Output" name="VGA_R(2:0)" />
        <port polarity="Output" name="VGA_G(2:0)" />
        <port polarity="Output" name="VGA_B(2:1)" />
        <port polarity="Input" name="CLK_12MHz" />
        <port polarity="Input" name="PL_LEFT" />
        <port polarity="Input" name="PL_RIGHT" />
        <blockdef name="driver">
            <timestamp>2021-5-6T19:42:37</timestamp>
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-448" height="576" />
        </blockdef>
        <blockdef name="picture">
            <timestamp>2021-5-20T21:31:56</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="148" height="24" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="384" />
        </blockdef>
        <blockdef name="logic">
            <timestamp>2021-6-17T20:48:48</timestamp>
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="512" y="-236" height="24" />
            <line x2="576" y1="-224" y2="-224" x1="512" />
            <rect width="64" x="512" y="-172" height="24" />
            <line x2="576" y1="-160" y2="-160" x1="512" />
            <rect width="64" x="512" y="-108" height="24" />
            <line x2="576" y1="-96" y2="-96" x1="512" />
            <rect width="64" x="512" y="-44" height="24" />
            <line x2="576" y1="-32" y2="-32" x1="512" />
            <rect width="448" x="64" y="-256" height="640" />
        </blockdef>
        <blockdef name="color_converter">
            <timestamp>2021-6-11T14:14:23</timestamp>
            <rect width="320" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-172" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="vgaclk">
            <timestamp>2021-6-17T19:50:57</timestamp>
            <rect width="336" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <block symbolname="driver" name="XLXI_1">
            <blockpin signalname="XLXN_28" name="CLK_25MHz" />
            <blockpin signalname="XLXN_2(2:0)" name="RGB(2:0)" />
            <blockpin signalname="XLXN_36" name="VGA_R" />
            <blockpin signalname="XLXN_37" name="VGA_G" />
            <blockpin signalname="XLXN_38" name="VGA_B" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_4(9:0)" name="PIX_X(9:0)" />
            <blockpin signalname="XLXN_5(8:0)" name="PIX_Y(8:0)" />
            <blockpin signalname="XLXN_49" name="RESET" />
        </block>
        <block symbolname="picture" name="XLXI_2">
            <blockpin signalname="XLXN_4(9:0)" name="PIX_X(9:0)" />
            <blockpin signalname="XLXN_5(8:0)" name="PIX_Y(8:0)" />
            <blockpin signalname="XLXN_12(53:0)" name="ENABLED_TILES(53:0)" />
            <blockpin signalname="XLXN_13(9:0)" name="BALL_X(9:0)" />
            <blockpin signalname="XLXN_14(8:0)" name="BALL_Y(8:0)" />
            <blockpin signalname="XLXN_15(9:0)" name="PLATFORM_X(9:0)" />
            <blockpin signalname="XLXN_2(2:0)" name="RGB(2:0)" />
        </block>
        <block symbolname="logic" name="XLXI_3">
            <blockpin signalname="XLXN_28" name="CLK_25MHz" />
            <blockpin signalname="XLXN_49" name="RESET" />
            <blockpin signalname="XLXN_55" name="PL_LEFT" />
            <blockpin signalname="XLXN_56" name="PL_RIGHT" />
            <blockpin signalname="XLXN_12(53:0)" name="ENABLED_TILES(53:0)" />
            <blockpin signalname="XLXN_13(9:0)" name="BALL_X(9:0)" />
            <blockpin signalname="XLXN_14(8:0)" name="BALL_Y(8:0)" />
            <blockpin signalname="XLXN_15(9:0)" name="PLATFORM_X(9:0)" />
        </block>
        <block symbolname="color_converter" name="XLXI_6">
            <blockpin signalname="XLXN_36" name="VGA_R_IN" />
            <blockpin signalname="XLXN_37" name="VGA_G_IN" />
            <blockpin signalname="XLXN_38" name="VGA_B_IN" />
            <blockpin signalname="VGA_R(2:0)" name="VGA_R_OUT(2:0)" />
            <blockpin signalname="VGA_G(2:0)" name="VGA_G_OUT(2:0)" />
            <blockpin signalname="VGA_B(2:1)" name="VGA_B_OUT(2:1)" />
        </block>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="RESET" name="I" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="vgaclk" name="XLXI_8">
            <blockpin signalname="XLXN_49" name="RST_IN" />
            <blockpin signalname="CLK_12MHz" name="CLKIN_IN" />
            <blockpin name="LOCKED_OUT" />
            <blockpin signalname="XLXN_28" name="CLKFX_OUT" />
            <blockpin name="CLKIN_IBUFG_OUT" />
            <blockpin name="CLK0_OUT" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="PL_LEFT" name="I" />
            <blockpin signalname="XLXN_55" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="PL_RIGHT" name="I" />
            <blockpin signalname="XLXN_56" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_5(8:0)">
            <wire x2="1296" y1="864" y2="1216" x1="1296" />
            <wire x2="2384" y1="1216" y2="1216" x1="1296" />
            <wire x2="1344" y1="864" y2="864" x1="1296" />
            <wire x2="2384" y1="768" y2="768" x1="2368" />
            <wire x2="2384" y1="768" y2="1216" x1="2384" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="3024" y1="576" y2="576" x1="2368" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="3024" y1="640" y2="640" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="3024" y="640" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="3024" y="576" name="VGA_HS" orien="R0" />
        <instance x="1344" y="896" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_4(9:0)">
            <wire x2="1280" y1="800" y2="1232" x1="1280" />
            <wire x2="2464" y1="1232" y2="1232" x1="1280" />
            <wire x2="1344" y1="800" y2="800" x1="1280" />
            <wire x2="2464" y1="704" y2="704" x1="2368" />
            <wire x2="2464" y1="704" y2="1232" x1="2464" />
        </branch>
        <branch name="XLXN_12(53:0)">
            <wire x2="1344" y1="928" y2="928" x1="1072" />
        </branch>
        <branch name="XLXN_13(9:0)">
            <wire x2="1344" y1="992" y2="992" x1="1072" />
        </branch>
        <branch name="XLXN_14(8:0)">
            <wire x2="1344" y1="1056" y2="1056" x1="1072" />
        </branch>
        <branch name="XLXN_15(9:0)">
            <wire x2="1344" y1="1120" y2="1120" x1="1072" />
        </branch>
        <branch name="XLXN_2(2:0)">
            <wire x2="1760" y1="800" y2="800" x1="1728" />
            <wire x2="1760" y1="768" y2="800" x1="1760" />
            <wire x2="1984" y1="768" y2="768" x1="1760" />
        </branch>
        <instance x="1984" y="800" name="XLXI_1" orien="R0">
        </instance>
        <instance x="496" y="1152" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2464" y="544" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_36">
            <wire x2="2464" y1="384" y2="384" x1="2368" />
        </branch>
        <branch name="XLXN_37">
            <wire x2="2464" y1="448" y2="448" x1="2368" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="2464" y1="512" y2="512" x1="2368" />
        </branch>
        <branch name="VGA_R(2:0)">
            <wire x2="3024" y1="384" y2="384" x1="2912" />
        </branch>
        <branch name="VGA_G(2:0)">
            <wire x2="3024" y1="448" y2="448" x1="2912" />
        </branch>
        <branch name="VGA_B(2:1)">
            <wire x2="3024" y1="512" y2="512" x1="2912" />
        </branch>
        <iomarker fontsize="28" x="3024" y="384" name="VGA_R(2:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="448" name="VGA_G(2:0)" orien="R0" />
        <iomarker fontsize="28" x="3024" y="512" name="VGA_B(2:1)" orien="R0" />
        <branch name="CLK_12MHz">
            <wire x2="304" y1="640" y2="640" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="640" name="CLK_12MHz" orien="R180" />
        <branch name="RESET">
            <wire x2="176" y1="1248" y2="1248" x1="144" />
        </branch>
        <instance x="176" y="1280" name="XLXI_7" orien="R0" />
        <instance x="304" y="672" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_28">
            <wire x2="432" y1="832" y2="1184" x1="432" />
            <wire x2="496" y1="1184" y2="1184" x1="432" />
            <wire x2="1216" y1="832" y2="832" x1="432" />
            <wire x2="1216" y1="512" y2="512" x1="768" />
            <wire x2="1216" y1="512" y2="832" x1="1216" />
            <wire x2="1968" y1="512" y2="512" x1="1216" />
            <wire x2="1968" y1="512" y2="832" x1="1968" />
            <wire x2="1984" y1="832" y2="832" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="144" y="1248" name="RESET" orien="R180" />
        <branch name="XLXN_49">
            <wire x2="304" y1="448" y2="448" x1="224" />
            <wire x2="224" y1="448" y2="736" x1="224" />
            <wire x2="400" y1="736" y2="736" x1="224" />
            <wire x2="400" y1="736" y2="1232" x1="400" />
            <wire x2="400" y1="1232" y2="1248" x1="400" />
            <wire x2="448" y1="1232" y2="1232" x1="400" />
            <wire x2="448" y1="1232" y2="1248" x1="448" />
            <wire x2="496" y1="1248" y2="1248" x1="448" />
            <wire x2="448" y1="1248" y2="1600" x1="448" />
            <wire x2="1792" y1="1600" y2="1600" x1="448" />
            <wire x2="1984" y1="896" y2="896" x1="1792" />
            <wire x2="1792" y1="896" y2="1600" x1="1792" />
        </branch>
        <instance x="240" y="1472" name="XLXI_9" orien="R0" />
        <instance x="240" y="1536" name="XLXI_10" orien="R0" />
        <branch name="XLXN_55">
            <wire x2="496" y1="1440" y2="1440" x1="464" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="496" y1="1504" y2="1504" x1="464" />
        </branch>
        <iomarker fontsize="28" x="176" y="1440" name="PL_LEFT" orien="R180" />
        <iomarker fontsize="28" x="192" y="1504" name="PL_RIGHT" orien="R180" />
        <branch name="PL_LEFT">
            <wire x2="224" y1="1440" y2="1440" x1="176" />
            <wire x2="240" y1="1440" y2="1440" x1="224" />
        </branch>
        <branch name="PL_RIGHT">
            <wire x2="240" y1="1504" y2="1504" x1="192" />
        </branch>
    </sheet>
</drawing>