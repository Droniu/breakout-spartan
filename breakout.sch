<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(2:0)" />
        <signal name="XLXN_4(9:0)" />
        <signal name="XLXN_5(8:0)" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="XLXN_12(53:0)" />
        <signal name="XLXN_13(9:0)" />
        <signal name="XLXN_14(8:0)" />
        <signal name="XLXN_15(9:0)" />
        <signal name="XLXN_20" />
        <signal name="CLK_50MHz" />
        <signal name="XLXN_22" />
        <signal name="XLXN_25" />
        <signal name="RESET" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="CLK_50MHz" />
        <port polarity="Input" name="RESET" />
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
            <timestamp>2021-5-6T19:42:54</timestamp>
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
            <timestamp>2021-5-6T19:58:50</timestamp>
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
            <rect width="448" x="64" y="-256" height="384" />
        </blockdef>
        <blockdef name="clock">
            <timestamp>2021-5-6T9:11:36</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="driver" name="XLXI_1">
            <blockpin signalname="XLXN_28" name="CLK_25MHz" />
            <blockpin signalname="XLXN_2(2:0)" name="RGB(2:0)" />
            <blockpin signalname="VGA_R" name="VGA_R" />
            <blockpin signalname="VGA_G" name="VGA_G" />
            <blockpin signalname="VGA_B" name="VGA_B" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_4(9:0)" name="PIX_X(9:0)" />
            <blockpin signalname="XLXN_5(8:0)" name="PIX_Y(8:0)" />
            <blockpin signalname="RESET" name="RESET" />
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
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_12(53:0)" name="ENABLED_TILES(53:0)" />
            <blockpin signalname="XLXN_13(9:0)" name="BALL_X(9:0)" />
            <blockpin signalname="XLXN_14(8:0)" name="BALL_Y(8:0)" />
            <blockpin signalname="XLXN_15(9:0)" name="PLATFORM_X(9:0)" />
        </block>
        <block symbolname="clock" name="XLXI_4">
            <blockpin signalname="CLK_50MHz" name="CLK_50MHz" />
            <blockpin signalname="XLXN_28" name="CLK_25MHz" />
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
        <branch name="VGA_R">
            <wire x2="3024" y1="384" y2="384" x1="2368" />
        </branch>
        <branch name="VGA_G">
            <wire x2="3024" y1="448" y2="448" x1="2368" />
        </branch>
        <branch name="VGA_B">
            <wire x2="3024" y1="512" y2="512" x1="2368" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="3024" y1="576" y2="576" x1="2368" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="3024" y1="640" y2="640" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="3024" y="640" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="3024" y="576" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="3024" y="512" name="VGA_B" orien="R0" />
        <iomarker fontsize="28" x="3024" y="448" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="3024" y="384" name="VGA_R" orien="R0" />
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
        <branch name="CLK_50MHz">
            <wire x2="272" y1="384" y2="384" x1="224" />
        </branch>
        <iomarker fontsize="28" x="224" y="384" name="CLK_50MHz" orien="R180" />
        <instance x="272" y="416" name="XLXI_4" orien="R0">
        </instance>
        <instance x="496" y="1152" name="XLXI_3" orien="R0">
        </instance>
        <branch name="RESET">
            <wire x2="368" y1="1248" y2="1248" x1="160" />
            <wire x2="496" y1="1248" y2="1248" x1="368" />
            <wire x2="368" y1="1248" y2="1568" x1="368" />
            <wire x2="1920" y1="1568" y2="1568" x1="368" />
            <wire x2="1984" y1="896" y2="896" x1="1920" />
            <wire x2="1920" y1="896" y2="1568" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="160" y="1248" name="RESET" orien="R180" />
        <branch name="XLXN_28">
            <wire x2="432" y1="832" y2="1184" x1="432" />
            <wire x2="496" y1="1184" y2="1184" x1="432" />
            <wire x2="672" y1="832" y2="832" x1="432" />
            <wire x2="672" y1="384" y2="384" x1="656" />
            <wire x2="1968" y1="384" y2="384" x1="672" />
            <wire x2="1968" y1="384" y2="832" x1="1968" />
            <wire x2="1984" y1="832" y2="832" x1="1968" />
            <wire x2="672" y1="384" y2="832" x1="672" />
        </branch>
    </sheet>
</drawing>