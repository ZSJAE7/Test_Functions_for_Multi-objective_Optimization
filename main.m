function main(varargin)

    cd(fileparts(mfilename('fullpath')));
    addpath(genpath(cd));
    
    %Problems that can chage the number of objectives
    prob = {@DTLZ1, @DTLZ2, @DTLZ3, @DTLZ4, @DTLZ5, @DTLZ6, @DTLZ7, @DTLZ8, @DTLZ9 ...
        @C1_DTLZ1, @C1_DTLZ3, @C2_DTLZ2, @C3_DTLZ4, @CDTLZ2, @DTLZ5IM ...
        @IDTLZ1, @IDTLZ2, @SDTLZ1, @SDTLZ2 ...
        @MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF10, @MaF11, @MaF12, @MaF13, @MaF14, @MaF15 ...
        @SMOP1, @SMOP2, @SMOP3, @SMOP4, @SMOP5, @SMOP6, @SMOP7, @SMOP8 ...
        @WFG1, @WFG2, @WFG3, @WFG4, @WFG5, @WFG6, @WFG7, @WFG8, @WFG9};

    for M = 2 : 3
        for i = 1 : size(prob,2)
            varargin = {'-D',5,'-M',M,'-problem',prob{i}};
            Global = GLOBAL(varargin{:});
            Global.Start();
        end
    end
    
    %Problems that can not chage the number of objectives
    prob = {@BT1, @BT2, @BT3, @BT4, @BT5, @BT6, @BT7, @BT8, @BT9 ...
        @CF1, @CF2, @CF3, @CF4, @CF5, @CF6, @CF7, @CF8, @CF9, @CF10 ...
        @DASCMOP1,@DASCMOP2,@DASCMOP3,@DASCMOP4,@DASCMOP5,@DASCMOP6,@DASCMOP7,@DASCMOP8,@DASCMOP9 ...
        @DOC1,@DOC2,@DOC3,@DOC4,@DOC5,@DOC6,@DOC7,@DOC8, @DOC9 ...
        @IMOP1, @IMOP2, @IMOP3, @IMOP4, @IMOP5, @IMOP6, @IMOP7, @IMOP8 ...
        @LIRCMOP1,@LIRCMOP2,@LIRCMOP3,@LIRCMOP4,@LIRCMOP5,@LIRCMOP6,@LIRCMOP7,@LIRCMOP8,@LIRCMOP9,@LIRCMOP10,@LIRCMOP11,@LIRCMOP12,@LIRCMOP13,@LIRCMOP14 ...
        @IMMOEA_F1, @IMMOEA_F2, @IMMOEA_F3, @IMMOEA_F4, @IMMOEA_F5, @IMMOEA_F6, @IMMOEA_F7, @IMMOEA_F8, @IMMOEA_F9, @IMMOEA_F10 ...
        @MOEADDE_F1, @MOEADDE_F2, @MOEADDE_F3, @MOEADDE_F4, @MOEADDE_F5, @MOEADDE_F6, @MOEADDE_F7, @MOEADDE_F8, @MOEADDE_F9 ...
        @MOEADM2M_F1, @MOEADM2M_F2, @MOEADM2M_F3, @MOEADM2M_F4, @MOEADM2M_F5, @MOEADM2M_F6, @MOEADM2M_F7 ...
        @RMMEDA_F1, @RMMEDA_F10, @RMMEDA_F2, @RMMEDA_F3, @RMMEDA_F4, @RMMEDA_F5, @RMMEDA_F6, @RMMEDA_F7, @RMMEDA_F8, @RMMEDA_F9...
        @MW1,@MW2,@MW3,@MW4,@MW5,@MW6,@MW7,@MW8,@MW9,@MW10,@MW11,@MW12,@MW13,@MW14 ...
        @TREE1, @TREE2, @TREE3, @TREE4, @TREE5, @TREE6 ...
        @UF1, @UF2, @UF3, @UF4, @UF5, @UF6, @UF7, @UF8, @UF9, @UF10 ...
        @VNT1, @VNT2, @VNT3, @VNT4 ...
        @ZDT1, @ZDT2, @ZDT3, @ZDT4, @ZDT5, @ZDT6};
    
    for i = 1 : size(prob,2)
        varargin = {'-D',5,'-problem',prob{i}};
        Global = GLOBAL(varargin{:});
        Global.Start();
    end
    
    %Distance minimization problems
    prob = {@MLDMP, @MPDMP, @MaF8, @MaF9};
    for i = 1 : size(prob,2)
        varargin = {'-M',3,'-problem',prob{i}};
        Global = GLOBAL(varargin{:});
        Global.Start();
    end
    
    %Problems that have too many decision variables
    prob = {@MOKP, @MOTSP, @mQAP...
        @LSMOP1, @LSMOP2, @LSMOP3, @LSMOP4, @LSMOP5, @LSMOP6, @LSMOP7, @LSMOP8, @LSMOP9};
    for M = 2 : 3
        for i = 1 : size(prob,2)
            varargin = {'-M',M,'-problem',prob{i}};
            Global = GLOBAL(varargin{:});
            Global.Start();
        end
    end
    
    varargin = {'-problem',@MONRP};
    Global = GLOBAL(varargin{:});
    Global.Start();
    
    %Problems that can not be used with this visualizer program
    %prob = {@UF11, @UF12}
    %UF11 and UF12 have 5 objectives. I have no image.
end