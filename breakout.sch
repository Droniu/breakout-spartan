<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK_50MHz" />
        <signal name="XLXN_2(2:0)" />
        <signal name="XLXN_3(9:0)" />
        <signal name="XLXN_4(9:0)" />
        <signal name="XLXN_5(8:0)" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <port polarity="Input" name="CLK_50MHz" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <blockdef name="driver">
            <timestamp>2021-4-7T19:42:42</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
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
        </blockdef>
        <blockdef name="picture">
            <timestamp>2021-4-7T19:59:53</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="driver" name="XLXI_1">
            <blockpin signalname="CLK_50MHz" name="CLK_50MHz" />
            <blockpin signalname="XLXN_2(2:0)" name="RGB(2:0)" />
            <blockpin signalname="VGA_R" name="VGA_R" />
            <blockpin signalname="VGA_G" name="VGA_G" />
            <blockpin signalname="VGA_B" name="VGA_B" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_3(9:0)" name="PIX_X(9:0)" />
            <blockpin signalname="XLXN_5(8:0)" name="PIX_Y(8:0)" />
        </block>
        <block symbolname="picture" name="XLXI_2">
            <blockpin signalname="XLXN_4(9:0)" name="PIX_X(9:0)" />
            <blockpin signalname="XLXN_5(8:0)" name="PIX_Y(8:0)" />
            <blockpin signalname="XLXN_2(2:0)" name="RGB(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1984" y="800" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK_50MHz">
            <wire x2="1984" y1="384" y2="384" x1="384" />
        </branch>
        <iomarker fontsize="28" x="384" y="384" name="CLK_50MHz" orien="R180" />
        <branch name="XLXN_2(2:0)">
            <wire x2="1984" y1="768" y2="768" x1="1536" />
        </branch>
        <instance x="1152" y="864" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_3(9:0)">
            <wire x2="2640" y1="704" y2="704" x1="2368" />
        </branch>
        <branch name="XLXN_4(9:0)">
            <wire x2="992" y1="768" y2="1168" x1="992" />
            <wire x2="2656" y1="1168" y2="1168" x1="992" />
            <wire x2="1152" y1="768" y2="768" x1="992" />
            <wire x2="2656" y1="704" y2="1168" x1="2656" />
        </branch>
        <branch name="XLXN_5(8:0)">
            <wire x2="1104" y1="832" y2="1040" x1="1104" />
            <wire x2="2496" y1="1040" y2="1040" x1="1104" />
            <wire x2="1152" y1="832" y2="832" x1="1104" />
            <wire x2="2496" y1="768" y2="768" x1="2368" />
            <wire x2="2496" y1="768" y2="1040" x1="2496" />
        </branch>
        <branch name="VGA_R">
            <wire x2="2384" y1="384" y2="384" x1="2368" />
            <wire x2="3024" y1="384" y2="384" x1="2384" />
        </branch>
        <branch name="VGA_G">
            <wire x2="2384" y1="448" y2="448" x1="2368" />
            <wire x2="3024" y1="448" y2="448" x1="2384" />
        </branch>
        <branch name="VGA_B">
            <wire x2="2384" y1="512" y2="512" x1="2368" />
            <wire x2="3024" y1="512" y2="512" x1="2384" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="2384" y1="576" y2="576" x1="2368" />
            <wire x2="3024" y1="576" y2="576" x1="2384" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="3024" y1="640" y2="640" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="3024" y="640" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="3024" y="576" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="3024" y="512" name="VGA_B" orien="R0" />
        <iomarker fontsize="28" x="3024" y="448" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="3024" y="384" name="VGA_R" orien="R0" />
    </sheet>
</drawing>