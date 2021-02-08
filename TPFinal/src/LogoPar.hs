{-# OPTIONS_GHC -w #-}
module LogoPar where
  import Common
  import qualified Data.Array as Happy_Data_Array
  import qualified Data.Bits as Bits
  import Control.Applicative(Applicative(..))
  import Control.Monad (ap)

    -- parser produced by Happy Version 1.20.0

  data HappyAbsSyn 
    = HappyTerminal (Token)
      | HappyErrorToken Prelude.Int
      | HappyAbsSyn4 (Comm)
      | HappyAbsSyn5 (Exp)
      | HappyAbsSyn6 (List)
      | HappyAbsSyn7 ([Exp])
      | HappyAbsSyn8 ([String])
      | HappyAbsSyn9 (Boolen)

    {- to allow type-synonyms as our monads (likely
    - with explicitly-specified bind and return)
    - in Haskell98, it seems that with
    - /type M a = .../, then /(HappyReduction M)/
    - is not allowed.  But Happy is a
    - code-generator that can just substitute it.
    type HappyReduction m = 
        Prelude.Int 
      -> (Token)
      -> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
      -> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
      -> HappyStk HappyAbsSyn 
      -> [(Token)] -> m HappyAbsSyn
    -}

    action_0,
    action_1,
    action_2,
    action_3,
    action_4,
    action_5,
    action_6,
    action_7,
    action_8,
    action_9,
    action_10,
    action_11,
    action_12,
    action_13,
    action_14,
    action_15,
    action_16,
    action_17,
    action_18,
    action_19,
    action_20,
    action_21,
    action_22,
    action_23,
    action_24,
    action_25,
    action_26,
    action_27,
    action_28,
    action_29,
    action_30,
    action_31,
    action_32,
    action_33,
    action_34,
    action_35,
    action_36,
    action_37,
    action_38,
    action_39,
    action_40,
    action_41,
    action_42,
    action_43,
    action_44,
    action_45,
    action_46,
    action_47,
    action_48,
    action_49,
    action_50,
    action_51,
    action_52,
    action_53,
    action_54,
    action_55,
    action_56,
    action_57,
    action_58,
    action_59,
    action_60,
    action_61,
    action_62,
    action_63,
    action_64,
    action_65,
    action_66,
    action_67,
    action_68,
    action_69,
    action_70,
    action_71,
    action_72,
    action_73,
    action_74,
    action_75,
    action_76,
    action_77,
    action_78,
    action_79,
    action_80,
    action_81,
    action_82,
    action_83,
    action_84,
    action_85,
    action_86,
    action_87,
    action_88,
    action_89,
    action_90,
    action_91,
    action_92,
    action_93,
    action_94,
    action_95,
    action_96,
    action_97,
    action_98,
    action_99,
    action_100,
    action_101,
    action_102,
    action_103,
    action_104,
    action_105,
    action_106,
    action_107,
    action_108,
    action_109,
    action_110,
    action_111,
    action_112,
    action_113,
    action_114,
    action_115,
    action_116,
    action_117,
    action_118,
    action_119,
    action_120,
    action_121,
    action_122,
    action_123,
    action_124,
    action_125,
    action_126,
    action_127,
    action_128,
    action_129,
    action_130,
    action_131,
    action_132,
    action_133,
    action_134,
    action_135,
    action_136,
    action_137,
    action_138,
    action_139,
    action_140,
    action_141,
    action_142,
    action_143,
    action_144,
    action_145,
    action_146,
    action_147,
    action_148,
    action_149,
    action_150,
    action_151,
    action_152,
    action_153,
    action_154,
    action_155,
    action_156,
    action_157,
    action_158 :: () => Prelude.Int -> ({-HappyReduction (HappyIdentity) = -}
        Prelude.Int 
      -> (Token)
      -> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
      -> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
      -> HappyStk HappyAbsSyn 
      -> [(Token)] -> (HappyIdentity) HappyAbsSyn)

    happyReduce_1,
    happyReduce_2,
    happyReduce_3,
    happyReduce_4,
    happyReduce_5,
    happyReduce_6,
    happyReduce_7,
    happyReduce_8,
    happyReduce_9,
    happyReduce_10,
    happyReduce_11,
    happyReduce_12,
    happyReduce_13,
    happyReduce_14,
    happyReduce_15,
    happyReduce_16,
    happyReduce_17,
    happyReduce_18,
    happyReduce_19,
    happyReduce_20,
    happyReduce_21,
    happyReduce_22,
    happyReduce_23,
    happyReduce_24,
    happyReduce_25,
    happyReduce_26,
    happyReduce_27,
    happyReduce_28,
    happyReduce_29,
    happyReduce_30,
    happyReduce_31,
    happyReduce_32,
    happyReduce_33,
    happyReduce_34,
    happyReduce_35,
    happyReduce_36,
    happyReduce_37,
    happyReduce_38,
    happyReduce_39,
    happyReduce_40,
    happyReduce_41,
    happyReduce_42,
    happyReduce_43,
    happyReduce_44,
    happyReduce_45,
    happyReduce_46,
    happyReduce_47,
    happyReduce_48,
    happyReduce_49,
    happyReduce_50,
    happyReduce_51,
    happyReduce_52,
    happyReduce_53,
    happyReduce_54,
    happyReduce_55,
    happyReduce_56,
    happyReduce_57,
    happyReduce_58,
    happyReduce_59,
    happyReduce_60,
    happyReduce_61,
    happyReduce_62,
    happyReduce_63,
    happyReduce_64,
    happyReduce_65,
    happyReduce_66,
    happyReduce_67,
    happyReduce_68,
    happyReduce_69,
    happyReduce_70,
    happyReduce_71 :: () => ({-HappyReduction (HappyIdentity) = -}
        Prelude.Int 
      -> (Token)
      -> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
      -> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
      -> HappyStk HappyAbsSyn 
      -> [(Token)] -> (HappyIdentity) HappyAbsSyn)

    happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
    happyExpList = Happy_Data_Array.listArray (0,570) ([65024,65535,16351,0,0,65280,65535,8175,0,0,65408,65535,4087,0,0,0,0,57344,22527,0,0,0,61440,11263,0,0,0,63488,5631,0,0,0,64512,2815,0,0,0,65024,1407,0,0,0,65280,703,0,0,0,65408,351,0,0,0,65472,175,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65024,1407,0,0,0,65280,703,0,0,0,65408,351,0,0,0,65472,175,0,0,0,65504,87,0,0,0,65520,43,0,0,0,65528,21,0,0,0,0,1,0,0,0,32766,5,0,0,0,0,1,0,0,0,0,4,0,0,49152,45055,2048,0,0,0,0,0,0,0,61440,11263,0,0,0,63488,5631,0,0,0,0,8192,0,65532,49151,127,0,0,0,0,0,0,0,65535,61439,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,8,0,0,0,32768,0,0,0,0,49151,2,0,0,32768,24575,1,0,0,12288,32768,0,0,0,6144,16384,0,0,0,61440,11263,0,0,0,1536,4096,0,0,0,768,2048,0,0,0,384,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,65472,175,0,0,0,0,256,0,0,0,0,32256,0,0,0,0,49216,0,0,0,65532,32778,0,0,0,32766,16389,0,0,0,16384,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,65280,703,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65504,65535,1021,0,0,65520,65535,510,0,0,0,0,0,256,0,0,0,65024,1407,0,0,0,65280,703,0,0,0,0,0,0,0,0,0,63744,1,0,0,0,128,57347,65535,65023,3,0,0,0,0,65528,21,1,0,0,65532,32778,0,0,0,32766,5,0,0,0,49151,2,0,0,32768,24575,1,0,0,49152,45055,0,0,0,57344,22527,0,0,0,61440,11263,0,65520,65535,510,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,65408,351,0,0,0,48,128,0,0,0,0,0,0,0,0,0,0,0,0,0,6,16,0,0,0,0,0,0,0,0,0,0,0,0,0,49151,2,0,0,32768,24575,1,0,0,0,0,0,0,0,0,0,0,65504,65535,1021,0,1,0,0,63488,5631,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,65535,65279,1,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,65528,32767,255,16384,0,0,0,0,0,0,0,0,65280,703,0,0,0,0,0,0,0,0,1024,0,49152,65535,65535,7,0,57344,65535,65023,3,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49151,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,192,0,0,0,16384,0,0,0,0,4096,0,65534,57343,63,0,0,0,0,0,1024,32768,65535,63487,15,0,49152,65535,64511,7,512,0,0,0,0,0,61440,65535,65279,1,128,0,0,0,0,0,0,0
      ])

    {-# NOINLINE happyExpListPerState #-}
    happyExpListPerState st =
        token_strs_expected
      where token_strs = ["error","%dummy","%start_logo","Comm","Exp","List","SecExp","Args","Bool","fordward","fd","back","bk","right","rt","left","lt","clearscreen","cs","clean","penup","pu","pendown","pd","hideturtle","ht","showturtle","st","home","setx","sety","setxy","setheading","seth","repeat","print","to","end","setcolor","make","for","if","fill","filled","wait","'do.while'","pos","list","xcor","ycor","heading","towards","':'","sum","difference","first","last","item","pick","butfirst","butlast","readword","var","num","'\"'","'('","')'","'['","']'","'>'","'<'","'='","'<='","'>='","'!='","'&&'","'||'","not","%eof"]
            bit_start = st Prelude.* 79
            bit_end = (st Prelude.+ 1) Prelude.* 79
            read_bit = readArrayBit happyExpList
            bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
            bits_indexed = Prelude.zip bits [0..78]
            token_strs_expected = Prelude.concatMap f bits_indexed
            f (Prelude.False, _) = []
            f (Prelude.True, nr) = [token_strs Prelude.!! nr]

    action_0 (10) = happyShift action_3
    action_0 (11) = happyShift action_4
    action_0 (12) = happyShift action_5
    action_0 (13) = happyShift action_6
    action_0 (14) = happyShift action_7
    action_0 (15) = happyShift action_8
    action_0 (16) = happyShift action_9
    action_0 (17) = happyShift action_10
    action_0 (18) = happyShift action_11
    action_0 (19) = happyShift action_12
    action_0 (20) = happyShift action_13
    action_0 (21) = happyShift action_14
    action_0 (22) = happyShift action_15
    action_0 (23) = happyShift action_16
    action_0 (24) = happyShift action_17
    action_0 (25) = happyShift action_18
    action_0 (26) = happyShift action_19
    action_0 (27) = happyShift action_20
    action_0 (28) = happyShift action_21
    action_0 (29) = happyShift action_22
    action_0 (30) = happyShift action_23
    action_0 (31) = happyShift action_24
    action_0 (32) = happyShift action_25
    action_0 (33) = happyShift action_26
    action_0 (34) = happyShift action_27
    action_0 (35) = happyShift action_28
    action_0 (36) = happyShift action_29
    action_0 (37) = happyShift action_30
    action_0 (39) = happyShift action_31
    action_0 (40) = happyShift action_32
    action_0 (41) = happyShift action_33
    action_0 (42) = happyShift action_34
    action_0 (43) = happyShift action_35
    action_0 (44) = happyShift action_36
    action_0 (45) = happyShift action_37
    action_0 (46) = happyShift action_38
    action_0 (4) = happyGoto action_39
    action_0 _ = happyFail (happyExpListPerState 0)

    action_1 (10) = happyShift action_3
    action_1 (11) = happyShift action_4
    action_1 (12) = happyShift action_5
    action_1 (13) = happyShift action_6
    action_1 (14) = happyShift action_7
    action_1 (15) = happyShift action_8
    action_1 (16) = happyShift action_9
    action_1 (17) = happyShift action_10
    action_1 (18) = happyShift action_11
    action_1 (19) = happyShift action_12
    action_1 (20) = happyShift action_13
    action_1 (21) = happyShift action_14
    action_1 (22) = happyShift action_15
    action_1 (23) = happyShift action_16
    action_1 (24) = happyShift action_17
    action_1 (25) = happyShift action_18
    action_1 (26) = happyShift action_19
    action_1 (27) = happyShift action_20
    action_1 (28) = happyShift action_21
    action_1 (29) = happyShift action_22
    action_1 (30) = happyShift action_23
    action_1 (31) = happyShift action_24
    action_1 (32) = happyShift action_25
    action_1 (33) = happyShift action_26
    action_1 (34) = happyShift action_27
    action_1 (35) = happyShift action_28
    action_1 (36) = happyShift action_29
    action_1 (37) = happyShift action_30
    action_1 (39) = happyShift action_31
    action_1 (40) = happyShift action_32
    action_1 (41) = happyShift action_33
    action_1 (42) = happyShift action_34
    action_1 (43) = happyShift action_35
    action_1 (44) = happyShift action_36
    action_1 (45) = happyShift action_37
    action_1 (46) = happyShift action_38
    action_1 (4) = happyGoto action_2
    action_1 _ = happyFail (happyExpListPerState 1)

    action_2 (10) = happyShift action_3
    action_2 (11) = happyShift action_4
    action_2 (12) = happyShift action_5
    action_2 (13) = happyShift action_6
    action_2 (14) = happyShift action_7
    action_2 (15) = happyShift action_8
    action_2 (16) = happyShift action_9
    action_2 (17) = happyShift action_10
    action_2 (18) = happyShift action_11
    action_2 (19) = happyShift action_12
    action_2 (20) = happyShift action_13
    action_2 (21) = happyShift action_14
    action_2 (22) = happyShift action_15
    action_2 (23) = happyShift action_16
    action_2 (24) = happyShift action_17
    action_2 (25) = happyShift action_18
    action_2 (26) = happyShift action_19
    action_2 (27) = happyShift action_20
    action_2 (28) = happyShift action_21
    action_2 (29) = happyShift action_22
    action_2 (30) = happyShift action_23
    action_2 (31) = happyShift action_24
    action_2 (32) = happyShift action_25
    action_2 (33) = happyShift action_26
    action_2 (34) = happyShift action_27
    action_2 (35) = happyShift action_28
    action_2 (36) = happyShift action_29
    action_2 (37) = happyShift action_30
    action_2 (39) = happyShift action_31
    action_2 (40) = happyShift action_32
    action_2 (41) = happyShift action_33
    action_2 (42) = happyShift action_34
    action_2 (43) = happyShift action_35
    action_2 (44) = happyShift action_36
    action_2 (45) = happyShift action_37
    action_2 (46) = happyShift action_38
    action_2 (4) = happyGoto action_40
    action_2 _ = happyFail (happyExpListPerState 2)

    action_3 (49) = happyShift action_43
    action_3 (50) = happyShift action_44
    action_3 (51) = happyShift action_45
    action_3 (52) = happyShift action_46
    action_3 (53) = happyShift action_47
    action_3 (54) = happyShift action_48
    action_3 (55) = happyShift action_49
    action_3 (56) = happyShift action_50
    action_3 (57) = happyShift action_51
    action_3 (58) = happyShift action_52
    action_3 (59) = happyShift action_53
    action_3 (60) = happyShift action_54
    action_3 (61) = happyShift action_55
    action_3 (62) = happyShift action_56
    action_3 (64) = happyShift action_57
    action_3 (66) = happyShift action_58
    action_3 (5) = happyGoto action_82
    action_3 _ = happyFail (happyExpListPerState 3)

    action_4 (49) = happyShift action_43
    action_4 (50) = happyShift action_44
    action_4 (51) = happyShift action_45
    action_4 (52) = happyShift action_46
    action_4 (53) = happyShift action_47
    action_4 (54) = happyShift action_48
    action_4 (55) = happyShift action_49
    action_4 (56) = happyShift action_50
    action_4 (57) = happyShift action_51
    action_4 (58) = happyShift action_52
    action_4 (59) = happyShift action_53
    action_4 (60) = happyShift action_54
    action_4 (61) = happyShift action_55
    action_4 (62) = happyShift action_56
    action_4 (64) = happyShift action_57
    action_4 (66) = happyShift action_58
    action_4 (5) = happyGoto action_81
    action_4 _ = happyFail (happyExpListPerState 4)

    action_5 (49) = happyShift action_43
    action_5 (50) = happyShift action_44
    action_5 (51) = happyShift action_45
    action_5 (52) = happyShift action_46
    action_5 (53) = happyShift action_47
    action_5 (54) = happyShift action_48
    action_5 (55) = happyShift action_49
    action_5 (56) = happyShift action_50
    action_5 (57) = happyShift action_51
    action_5 (58) = happyShift action_52
    action_5 (59) = happyShift action_53
    action_5 (60) = happyShift action_54
    action_5 (61) = happyShift action_55
    action_5 (62) = happyShift action_56
    action_5 (64) = happyShift action_57
    action_5 (66) = happyShift action_58
    action_5 (5) = happyGoto action_80
    action_5 _ = happyFail (happyExpListPerState 5)

    action_6 (49) = happyShift action_43
    action_6 (50) = happyShift action_44
    action_6 (51) = happyShift action_45
    action_6 (52) = happyShift action_46
    action_6 (53) = happyShift action_47
    action_6 (54) = happyShift action_48
    action_6 (55) = happyShift action_49
    action_6 (56) = happyShift action_50
    action_6 (57) = happyShift action_51
    action_6 (58) = happyShift action_52
    action_6 (59) = happyShift action_53
    action_6 (60) = happyShift action_54
    action_6 (61) = happyShift action_55
    action_6 (62) = happyShift action_56
    action_6 (64) = happyShift action_57
    action_6 (66) = happyShift action_58
    action_6 (5) = happyGoto action_79
    action_6 _ = happyFail (happyExpListPerState 6)

    action_7 (49) = happyShift action_43
    action_7 (50) = happyShift action_44
    action_7 (51) = happyShift action_45
    action_7 (52) = happyShift action_46
    action_7 (53) = happyShift action_47
    action_7 (54) = happyShift action_48
    action_7 (55) = happyShift action_49
    action_7 (56) = happyShift action_50
    action_7 (57) = happyShift action_51
    action_7 (58) = happyShift action_52
    action_7 (59) = happyShift action_53
    action_7 (60) = happyShift action_54
    action_7 (61) = happyShift action_55
    action_7 (62) = happyShift action_56
    action_7 (64) = happyShift action_57
    action_7 (66) = happyShift action_58
    action_7 (5) = happyGoto action_78
    action_7 _ = happyFail (happyExpListPerState 7)

    action_8 (49) = happyShift action_43
    action_8 (50) = happyShift action_44
    action_8 (51) = happyShift action_45
    action_8 (52) = happyShift action_46
    action_8 (53) = happyShift action_47
    action_8 (54) = happyShift action_48
    action_8 (55) = happyShift action_49
    action_8 (56) = happyShift action_50
    action_8 (57) = happyShift action_51
    action_8 (58) = happyShift action_52
    action_8 (59) = happyShift action_53
    action_8 (60) = happyShift action_54
    action_8 (61) = happyShift action_55
    action_8 (62) = happyShift action_56
    action_8 (64) = happyShift action_57
    action_8 (66) = happyShift action_58
    action_8 (5) = happyGoto action_77
    action_8 _ = happyFail (happyExpListPerState 8)

    action_9 (49) = happyShift action_43
    action_9 (50) = happyShift action_44
    action_9 (51) = happyShift action_45
    action_9 (52) = happyShift action_46
    action_9 (53) = happyShift action_47
    action_9 (54) = happyShift action_48
    action_9 (55) = happyShift action_49
    action_9 (56) = happyShift action_50
    action_9 (57) = happyShift action_51
    action_9 (58) = happyShift action_52
    action_9 (59) = happyShift action_53
    action_9 (60) = happyShift action_54
    action_9 (61) = happyShift action_55
    action_9 (62) = happyShift action_56
    action_9 (64) = happyShift action_57
    action_9 (66) = happyShift action_58
    action_9 (5) = happyGoto action_76
    action_9 _ = happyFail (happyExpListPerState 9)

    action_10 (49) = happyShift action_43
    action_10 (50) = happyShift action_44
    action_10 (51) = happyShift action_45
    action_10 (52) = happyShift action_46
    action_10 (53) = happyShift action_47
    action_10 (54) = happyShift action_48
    action_10 (55) = happyShift action_49
    action_10 (56) = happyShift action_50
    action_10 (57) = happyShift action_51
    action_10 (58) = happyShift action_52
    action_10 (59) = happyShift action_53
    action_10 (60) = happyShift action_54
    action_10 (61) = happyShift action_55
    action_10 (62) = happyShift action_56
    action_10 (64) = happyShift action_57
    action_10 (66) = happyShift action_58
    action_10 (5) = happyGoto action_75
    action_10 _ = happyFail (happyExpListPerState 10)

    action_11 _ = happyReduce_10

    action_12 _ = happyReduce_11

    action_13 _ = happyReduce_12

    action_14 _ = happyReduce_13

    action_15 _ = happyReduce_14

    action_16 _ = happyReduce_15

    action_17 _ = happyReduce_16

    action_18 _ = happyReduce_17

    action_19 _ = happyReduce_18

    action_20 _ = happyReduce_19

    action_21 _ = happyReduce_20

    action_22 _ = happyReduce_21

    action_23 (49) = happyShift action_43
    action_23 (50) = happyShift action_44
    action_23 (51) = happyShift action_45
    action_23 (52) = happyShift action_46
    action_23 (53) = happyShift action_47
    action_23 (54) = happyShift action_48
    action_23 (55) = happyShift action_49
    action_23 (56) = happyShift action_50
    action_23 (57) = happyShift action_51
    action_23 (58) = happyShift action_52
    action_23 (59) = happyShift action_53
    action_23 (60) = happyShift action_54
    action_23 (61) = happyShift action_55
    action_23 (62) = happyShift action_56
    action_23 (64) = happyShift action_57
    action_23 (66) = happyShift action_58
    action_23 (5) = happyGoto action_74
    action_23 _ = happyFail (happyExpListPerState 23)

    action_24 (49) = happyShift action_43
    action_24 (50) = happyShift action_44
    action_24 (51) = happyShift action_45
    action_24 (52) = happyShift action_46
    action_24 (53) = happyShift action_47
    action_24 (54) = happyShift action_48
    action_24 (55) = happyShift action_49
    action_24 (56) = happyShift action_50
    action_24 (57) = happyShift action_51
    action_24 (58) = happyShift action_52
    action_24 (59) = happyShift action_53
    action_24 (60) = happyShift action_54
    action_24 (61) = happyShift action_55
    action_24 (62) = happyShift action_56
    action_24 (64) = happyShift action_57
    action_24 (66) = happyShift action_58
    action_24 (5) = happyGoto action_73
    action_24 _ = happyFail (happyExpListPerState 24)

    action_25 (49) = happyShift action_43
    action_25 (50) = happyShift action_44
    action_25 (51) = happyShift action_45
    action_25 (52) = happyShift action_46
    action_25 (53) = happyShift action_47
    action_25 (54) = happyShift action_48
    action_25 (55) = happyShift action_49
    action_25 (56) = happyShift action_50
    action_25 (57) = happyShift action_51
    action_25 (58) = happyShift action_52
    action_25 (59) = happyShift action_53
    action_25 (60) = happyShift action_54
    action_25 (61) = happyShift action_55
    action_25 (62) = happyShift action_56
    action_25 (64) = happyShift action_57
    action_25 (66) = happyShift action_58
    action_25 (5) = happyGoto action_72
    action_25 _ = happyFail (happyExpListPerState 25)

    action_26 (49) = happyShift action_43
    action_26 (50) = happyShift action_44
    action_26 (51) = happyShift action_45
    action_26 (52) = happyShift action_46
    action_26 (53) = happyShift action_47
    action_26 (54) = happyShift action_48
    action_26 (55) = happyShift action_49
    action_26 (56) = happyShift action_50
    action_26 (57) = happyShift action_51
    action_26 (58) = happyShift action_52
    action_26 (59) = happyShift action_53
    action_26 (60) = happyShift action_54
    action_26 (61) = happyShift action_55
    action_26 (62) = happyShift action_56
    action_26 (64) = happyShift action_57
    action_26 (66) = happyShift action_58
    action_26 (5) = happyGoto action_71
    action_26 _ = happyFail (happyExpListPerState 26)

    action_27 (49) = happyShift action_43
    action_27 (50) = happyShift action_44
    action_27 (51) = happyShift action_45
    action_27 (52) = happyShift action_46
    action_27 (53) = happyShift action_47
    action_27 (54) = happyShift action_48
    action_27 (55) = happyShift action_49
    action_27 (56) = happyShift action_50
    action_27 (57) = happyShift action_51
    action_27 (58) = happyShift action_52
    action_27 (59) = happyShift action_53
    action_27 (60) = happyShift action_54
    action_27 (61) = happyShift action_55
    action_27 (62) = happyShift action_56
    action_27 (64) = happyShift action_57
    action_27 (66) = happyShift action_58
    action_27 (5) = happyGoto action_70
    action_27 _ = happyFail (happyExpListPerState 27)

    action_28 (49) = happyShift action_43
    action_28 (50) = happyShift action_44
    action_28 (51) = happyShift action_45
    action_28 (52) = happyShift action_46
    action_28 (53) = happyShift action_47
    action_28 (54) = happyShift action_48
    action_28 (55) = happyShift action_49
    action_28 (56) = happyShift action_50
    action_28 (57) = happyShift action_51
    action_28 (58) = happyShift action_52
    action_28 (59) = happyShift action_53
    action_28 (60) = happyShift action_54
    action_28 (61) = happyShift action_55
    action_28 (62) = happyShift action_56
    action_28 (64) = happyShift action_57
    action_28 (66) = happyShift action_58
    action_28 (5) = happyGoto action_69
    action_28 _ = happyFail (happyExpListPerState 28)

    action_29 (49) = happyShift action_43
    action_29 (50) = happyShift action_44
    action_29 (51) = happyShift action_45
    action_29 (52) = happyShift action_46
    action_29 (53) = happyShift action_47
    action_29 (54) = happyShift action_48
    action_29 (55) = happyShift action_49
    action_29 (56) = happyShift action_50
    action_29 (57) = happyShift action_51
    action_29 (58) = happyShift action_52
    action_29 (59) = happyShift action_53
    action_29 (60) = happyShift action_54
    action_29 (61) = happyShift action_55
    action_29 (62) = happyShift action_56
    action_29 (64) = happyShift action_57
    action_29 (66) = happyShift action_58
    action_29 (5) = happyGoto action_68
    action_29 _ = happyFail (happyExpListPerState 29)

    action_30 (63) = happyShift action_67
    action_30 _ = happyFail (happyExpListPerState 30)

    action_31 (49) = happyShift action_43
    action_31 (50) = happyShift action_44
    action_31 (51) = happyShift action_45
    action_31 (52) = happyShift action_46
    action_31 (53) = happyShift action_47
    action_31 (54) = happyShift action_48
    action_31 (55) = happyShift action_49
    action_31 (56) = happyShift action_50
    action_31 (57) = happyShift action_51
    action_31 (58) = happyShift action_52
    action_31 (59) = happyShift action_53
    action_31 (60) = happyShift action_54
    action_31 (61) = happyShift action_55
    action_31 (62) = happyShift action_56
    action_31 (64) = happyShift action_57
    action_31 (66) = happyShift action_58
    action_31 (5) = happyGoto action_66
    action_31 _ = happyFail (happyExpListPerState 31)

    action_32 (65) = happyShift action_65
    action_32 _ = happyFail (happyExpListPerState 32)

    action_33 (68) = happyShift action_64
    action_33 _ = happyFail (happyExpListPerState 33)

    action_34 (49) = happyShift action_43
    action_34 (50) = happyShift action_44
    action_34 (51) = happyShift action_45
    action_34 (52) = happyShift action_46
    action_34 (53) = happyShift action_47
    action_34 (54) = happyShift action_48
    action_34 (55) = happyShift action_49
    action_34 (56) = happyShift action_50
    action_34 (57) = happyShift action_51
    action_34 (58) = happyShift action_52
    action_34 (59) = happyShift action_53
    action_34 (60) = happyShift action_54
    action_34 (61) = happyShift action_55
    action_34 (62) = happyShift action_56
    action_34 (64) = happyShift action_57
    action_34 (66) = happyShift action_62
    action_34 (78) = happyShift action_63
    action_34 (5) = happyGoto action_60
    action_34 (9) = happyGoto action_61
    action_34 _ = happyFail (happyExpListPerState 34)

    action_35 _ = happyReduce_35

    action_36 (49) = happyShift action_43
    action_36 (50) = happyShift action_44
    action_36 (51) = happyShift action_45
    action_36 (52) = happyShift action_46
    action_36 (53) = happyShift action_47
    action_36 (54) = happyShift action_48
    action_36 (55) = happyShift action_49
    action_36 (56) = happyShift action_50
    action_36 (57) = happyShift action_51
    action_36 (58) = happyShift action_52
    action_36 (59) = happyShift action_53
    action_36 (60) = happyShift action_54
    action_36 (61) = happyShift action_55
    action_36 (62) = happyShift action_56
    action_36 (64) = happyShift action_57
    action_36 (66) = happyShift action_58
    action_36 (5) = happyGoto action_59
    action_36 _ = happyFail (happyExpListPerState 36)

    action_37 (49) = happyShift action_43
    action_37 (50) = happyShift action_44
    action_37 (51) = happyShift action_45
    action_37 (52) = happyShift action_46
    action_37 (53) = happyShift action_47
    action_37 (54) = happyShift action_48
    action_37 (55) = happyShift action_49
    action_37 (56) = happyShift action_50
    action_37 (57) = happyShift action_51
    action_37 (58) = happyShift action_52
    action_37 (59) = happyShift action_53
    action_37 (60) = happyShift action_54
    action_37 (61) = happyShift action_55
    action_37 (62) = happyShift action_56
    action_37 (64) = happyShift action_57
    action_37 (66) = happyShift action_58
    action_37 (5) = happyGoto action_42
    action_37 _ = happyFail (happyExpListPerState 37)

    action_38 (68) = happyShift action_41
    action_38 _ = happyFail (happyExpListPerState 38)

    action_39 (10) = happyShift action_3
    action_39 (11) = happyShift action_4
    action_39 (12) = happyShift action_5
    action_39 (13) = happyShift action_6
    action_39 (14) = happyShift action_7
    action_39 (15) = happyShift action_8
    action_39 (16) = happyShift action_9
    action_39 (17) = happyShift action_10
    action_39 (18) = happyShift action_11
    action_39 (19) = happyShift action_12
    action_39 (20) = happyShift action_13
    action_39 (21) = happyShift action_14
    action_39 (22) = happyShift action_15
    action_39 (23) = happyShift action_16
    action_39 (24) = happyShift action_17
    action_39 (25) = happyShift action_18
    action_39 (26) = happyShift action_19
    action_39 (27) = happyShift action_20
    action_39 (28) = happyShift action_21
    action_39 (29) = happyShift action_22
    action_39 (30) = happyShift action_23
    action_39 (31) = happyShift action_24
    action_39 (32) = happyShift action_25
    action_39 (33) = happyShift action_26
    action_39 (34) = happyShift action_27
    action_39 (35) = happyShift action_28
    action_39 (36) = happyShift action_29
    action_39 (37) = happyShift action_30
    action_39 (39) = happyShift action_31
    action_39 (40) = happyShift action_32
    action_39 (41) = happyShift action_33
    action_39 (42) = happyShift action_34
    action_39 (43) = happyShift action_35
    action_39 (44) = happyShift action_36
    action_39 (45) = happyShift action_37
    action_39 (46) = happyShift action_38
    action_39 (79) = happyAccept
    action_39 (4) = happyGoto action_40
    action_39 _ = happyFail (happyExpListPerState 39)

    action_40 (10) = happyShift action_3
    action_40 (11) = happyShift action_4
    action_40 (12) = happyShift action_5
    action_40 (13) = happyShift action_6
    action_40 (14) = happyShift action_7
    action_40 (15) = happyShift action_8
    action_40 (16) = happyShift action_9
    action_40 (17) = happyShift action_10
    action_40 (18) = happyShift action_11
    action_40 (19) = happyShift action_12
    action_40 (20) = happyShift action_13
    action_40 (21) = happyShift action_14
    action_40 (22) = happyShift action_15
    action_40 (23) = happyShift action_16
    action_40 (24) = happyShift action_17
    action_40 (25) = happyShift action_18
    action_40 (26) = happyShift action_19
    action_40 (27) = happyShift action_20
    action_40 (28) = happyShift action_21
    action_40 (29) = happyShift action_22
    action_40 (30) = happyShift action_23
    action_40 (31) = happyShift action_24
    action_40 (32) = happyShift action_25
    action_40 (33) = happyShift action_26
    action_40 (34) = happyShift action_27
    action_40 (35) = happyShift action_28
    action_40 (36) = happyShift action_29
    action_40 (37) = happyShift action_30
    action_40 (39) = happyShift action_31
    action_40 (40) = happyShift action_32
    action_40 (41) = happyShift action_33
    action_40 (42) = happyShift action_34
    action_40 (43) = happyShift action_35
    action_40 (44) = happyShift action_36
    action_40 (45) = happyShift action_37
    action_40 (46) = happyShift action_38
    action_40 (4) = happyGoto action_40
    action_40 _ = happyReduce_1

    action_41 (10) = happyShift action_3
    action_41 (11) = happyShift action_4
    action_41 (12) = happyShift action_5
    action_41 (13) = happyShift action_6
    action_41 (14) = happyShift action_7
    action_41 (15) = happyShift action_8
    action_41 (16) = happyShift action_9
    action_41 (17) = happyShift action_10
    action_41 (18) = happyShift action_11
    action_41 (19) = happyShift action_12
    action_41 (20) = happyShift action_13
    action_41 (21) = happyShift action_14
    action_41 (22) = happyShift action_15
    action_41 (23) = happyShift action_16
    action_41 (24) = happyShift action_17
    action_41 (25) = happyShift action_18
    action_41 (26) = happyShift action_19
    action_41 (27) = happyShift action_20
    action_41 (28) = happyShift action_21
    action_41 (29) = happyShift action_22
    action_41 (30) = happyShift action_23
    action_41 (31) = happyShift action_24
    action_41 (32) = happyShift action_25
    action_41 (33) = happyShift action_26
    action_41 (34) = happyShift action_27
    action_41 (35) = happyShift action_28
    action_41 (36) = happyShift action_29
    action_41 (37) = happyShift action_30
    action_41 (39) = happyShift action_31
    action_41 (40) = happyShift action_32
    action_41 (41) = happyShift action_33
    action_41 (42) = happyShift action_34
    action_41 (43) = happyShift action_35
    action_41 (44) = happyShift action_36
    action_41 (45) = happyShift action_37
    action_41 (46) = happyShift action_38
    action_41 (4) = happyGoto action_116
    action_41 _ = happyFail (happyExpListPerState 41)

    action_42 _ = happyReduce_37

    action_43 _ = happyReduce_40

    action_44 _ = happyReduce_41

    action_45 _ = happyReduce_42

    action_46 (47) = happyShift action_104
    action_46 (48) = happyShift action_105
    action_46 (66) = happyShift action_106
    action_46 (6) = happyGoto action_115
    action_46 _ = happyFail (happyExpListPerState 46)

    action_47 (63) = happyShift action_114
    action_47 _ = happyFail (happyExpListPerState 47)

    action_48 (49) = happyShift action_43
    action_48 (50) = happyShift action_44
    action_48 (51) = happyShift action_45
    action_48 (52) = happyShift action_46
    action_48 (53) = happyShift action_47
    action_48 (54) = happyShift action_48
    action_48 (55) = happyShift action_49
    action_48 (56) = happyShift action_50
    action_48 (57) = happyShift action_51
    action_48 (58) = happyShift action_52
    action_48 (59) = happyShift action_53
    action_48 (60) = happyShift action_54
    action_48 (61) = happyShift action_55
    action_48 (62) = happyShift action_56
    action_48 (64) = happyShift action_57
    action_48 (66) = happyShift action_58
    action_48 (5) = happyGoto action_113
    action_48 _ = happyFail (happyExpListPerState 48)

    action_49 (49) = happyShift action_43
    action_49 (50) = happyShift action_44
    action_49 (51) = happyShift action_45
    action_49 (52) = happyShift action_46
    action_49 (53) = happyShift action_47
    action_49 (54) = happyShift action_48
    action_49 (55) = happyShift action_49
    action_49 (56) = happyShift action_50
    action_49 (57) = happyShift action_51
    action_49 (58) = happyShift action_52
    action_49 (59) = happyShift action_53
    action_49 (60) = happyShift action_54
    action_49 (61) = happyShift action_55
    action_49 (62) = happyShift action_56
    action_49 (64) = happyShift action_57
    action_49 (66) = happyShift action_58
    action_49 (5) = happyGoto action_112
    action_49 _ = happyFail (happyExpListPerState 49)

    action_50 (47) = happyShift action_104
    action_50 (48) = happyShift action_105
    action_50 (66) = happyShift action_106
    action_50 (6) = happyGoto action_111
    action_50 _ = happyFail (happyExpListPerState 50)

    action_51 (47) = happyShift action_104
    action_51 (48) = happyShift action_105
    action_51 (66) = happyShift action_106
    action_51 (6) = happyGoto action_110
    action_51 _ = happyFail (happyExpListPerState 51)

    action_52 (49) = happyShift action_43
    action_52 (50) = happyShift action_44
    action_52 (51) = happyShift action_45
    action_52 (52) = happyShift action_46
    action_52 (53) = happyShift action_47
    action_52 (54) = happyShift action_48
    action_52 (55) = happyShift action_49
    action_52 (56) = happyShift action_50
    action_52 (57) = happyShift action_51
    action_52 (58) = happyShift action_52
    action_52 (59) = happyShift action_53
    action_52 (60) = happyShift action_54
    action_52 (61) = happyShift action_55
    action_52 (62) = happyShift action_56
    action_52 (64) = happyShift action_57
    action_52 (66) = happyShift action_58
    action_52 (5) = happyGoto action_109
    action_52 _ = happyFail (happyExpListPerState 52)

    action_53 (47) = happyShift action_104
    action_53 (48) = happyShift action_105
    action_53 (66) = happyShift action_106
    action_53 (6) = happyGoto action_108
    action_53 _ = happyFail (happyExpListPerState 53)

    action_54 (47) = happyShift action_104
    action_54 (48) = happyShift action_105
    action_54 (66) = happyShift action_106
    action_54 (6) = happyGoto action_107
    action_54 _ = happyFail (happyExpListPerState 54)

    action_55 (47) = happyShift action_104
    action_55 (48) = happyShift action_105
    action_55 (66) = happyShift action_106
    action_55 (6) = happyGoto action_103
    action_55 _ = happyFail (happyExpListPerState 55)

    action_56 _ = happyReduce_53

    action_57 _ = happyReduce_39

    action_58 (49) = happyShift action_43
    action_58 (50) = happyShift action_44
    action_58 (51) = happyShift action_45
    action_58 (52) = happyShift action_46
    action_58 (53) = happyShift action_47
    action_58 (54) = happyShift action_48
    action_58 (55) = happyShift action_49
    action_58 (56) = happyShift action_50
    action_58 (57) = happyShift action_51
    action_58 (58) = happyShift action_52
    action_58 (59) = happyShift action_53
    action_58 (60) = happyShift action_54
    action_58 (61) = happyShift action_55
    action_58 (62) = happyShift action_56
    action_58 (64) = happyShift action_57
    action_58 (66) = happyShift action_58
    action_58 (5) = happyGoto action_102
    action_58 _ = happyFail (happyExpListPerState 58)

    action_59 (68) = happyShift action_101
    action_59 _ = happyFail (happyExpListPerState 59)

    action_60 (70) = happyShift action_95
    action_60 (71) = happyShift action_96
    action_60 (72) = happyShift action_97
    action_60 (73) = happyShift action_98
    action_60 (74) = happyShift action_99
    action_60 (75) = happyShift action_100
    action_60 _ = happyFail (happyExpListPerState 60)

    action_61 (68) = happyShift action_92
    action_61 (76) = happyShift action_93
    action_61 (77) = happyShift action_94
    action_61 _ = happyFail (happyExpListPerState 61)

    action_62 (49) = happyShift action_43
    action_62 (50) = happyShift action_44
    action_62 (51) = happyShift action_45
    action_62 (52) = happyShift action_46
    action_62 (53) = happyShift action_47
    action_62 (54) = happyShift action_48
    action_62 (55) = happyShift action_49
    action_62 (56) = happyShift action_50
    action_62 (57) = happyShift action_51
    action_62 (58) = happyShift action_52
    action_62 (59) = happyShift action_53
    action_62 (60) = happyShift action_54
    action_62 (61) = happyShift action_55
    action_62 (62) = happyShift action_56
    action_62 (64) = happyShift action_57
    action_62 (66) = happyShift action_62
    action_62 (78) = happyShift action_63
    action_62 (5) = happyGoto action_90
    action_62 (9) = happyGoto action_91
    action_62 _ = happyFail (happyExpListPerState 62)

    action_63 (49) = happyShift action_43
    action_63 (50) = happyShift action_44
    action_63 (51) = happyShift action_45
    action_63 (52) = happyShift action_46
    action_63 (53) = happyShift action_47
    action_63 (54) = happyShift action_48
    action_63 (55) = happyShift action_49
    action_63 (56) = happyShift action_50
    action_63 (57) = happyShift action_51
    action_63 (58) = happyShift action_52
    action_63 (59) = happyShift action_53
    action_63 (60) = happyShift action_54
    action_63 (61) = happyShift action_55
    action_63 (62) = happyShift action_56
    action_63 (64) = happyShift action_57
    action_63 (66) = happyShift action_62
    action_63 (78) = happyShift action_63
    action_63 (5) = happyGoto action_60
    action_63 (9) = happyGoto action_89
    action_63 _ = happyFail (happyExpListPerState 63)

    action_64 (63) = happyShift action_88
    action_64 _ = happyFail (happyExpListPerState 64)

    action_65 (63) = happyShift action_87
    action_65 _ = happyFail (happyExpListPerState 65)

    action_66 _ = happyReduce_30

    action_67 (53) = happyShift action_86
    action_67 (8) = happyGoto action_85
    action_67 _ = happyFail (happyExpListPerState 67)

    action_68 _ = happyReduce_28

    action_69 (68) = happyShift action_84
    action_69 _ = happyFail (happyExpListPerState 69)

    action_70 _ = happyReduce_26

    action_71 _ = happyReduce_25

    action_72 (49) = happyShift action_43
    action_72 (50) = happyShift action_44
    action_72 (51) = happyShift action_45
    action_72 (52) = happyShift action_46
    action_72 (53) = happyShift action_47
    action_72 (54) = happyShift action_48
    action_72 (55) = happyShift action_49
    action_72 (56) = happyShift action_50
    action_72 (57) = happyShift action_51
    action_72 (58) = happyShift action_52
    action_72 (59) = happyShift action_53
    action_72 (60) = happyShift action_54
    action_72 (61) = happyShift action_55
    action_72 (62) = happyShift action_56
    action_72 (64) = happyShift action_57
    action_72 (66) = happyShift action_58
    action_72 (5) = happyGoto action_83
    action_72 _ = happyFail (happyExpListPerState 72)

    action_73 _ = happyReduce_23

    action_74 _ = happyReduce_22

    action_75 _ = happyReduce_9

    action_76 _ = happyReduce_8

    action_77 _ = happyReduce_7

    action_78 _ = happyReduce_6

    action_79 _ = happyReduce_5

    action_80 _ = happyReduce_4

    action_81 _ = happyReduce_3

    action_82 _ = happyReduce_2

    action_83 _ = happyReduce_24

    action_84 (10) = happyShift action_3
    action_84 (11) = happyShift action_4
    action_84 (12) = happyShift action_5
    action_84 (13) = happyShift action_6
    action_84 (14) = happyShift action_7
    action_84 (15) = happyShift action_8
    action_84 (16) = happyShift action_9
    action_84 (17) = happyShift action_10
    action_84 (18) = happyShift action_11
    action_84 (19) = happyShift action_12
    action_84 (20) = happyShift action_13
    action_84 (21) = happyShift action_14
    action_84 (22) = happyShift action_15
    action_84 (23) = happyShift action_16
    action_84 (24) = happyShift action_17
    action_84 (25) = happyShift action_18
    action_84 (26) = happyShift action_19
    action_84 (27) = happyShift action_20
    action_84 (28) = happyShift action_21
    action_84 (29) = happyShift action_22
    action_84 (30) = happyShift action_23
    action_84 (31) = happyShift action_24
    action_84 (32) = happyShift action_25
    action_84 (33) = happyShift action_26
    action_84 (34) = happyShift action_27
    action_84 (35) = happyShift action_28
    action_84 (36) = happyShift action_29
    action_84 (37) = happyShift action_30
    action_84 (39) = happyShift action_31
    action_84 (40) = happyShift action_32
    action_84 (41) = happyShift action_33
    action_84 (42) = happyShift action_34
    action_84 (43) = happyShift action_35
    action_84 (44) = happyShift action_36
    action_84 (45) = happyShift action_37
    action_84 (46) = happyShift action_38
    action_84 (4) = happyGoto action_140
    action_84 _ = happyFail (happyExpListPerState 84)

    action_85 (10) = happyShift action_3
    action_85 (11) = happyShift action_4
    action_85 (12) = happyShift action_5
    action_85 (13) = happyShift action_6
    action_85 (14) = happyShift action_7
    action_85 (15) = happyShift action_8
    action_85 (16) = happyShift action_9
    action_85 (17) = happyShift action_10
    action_85 (18) = happyShift action_11
    action_85 (19) = happyShift action_12
    action_85 (20) = happyShift action_13
    action_85 (21) = happyShift action_14
    action_85 (22) = happyShift action_15
    action_85 (23) = happyShift action_16
    action_85 (24) = happyShift action_17
    action_85 (25) = happyShift action_18
    action_85 (26) = happyShift action_19
    action_85 (27) = happyShift action_20
    action_85 (28) = happyShift action_21
    action_85 (29) = happyShift action_22
    action_85 (30) = happyShift action_23
    action_85 (31) = happyShift action_24
    action_85 (32) = happyShift action_25
    action_85 (33) = happyShift action_26
    action_85 (34) = happyShift action_27
    action_85 (35) = happyShift action_28
    action_85 (36) = happyShift action_29
    action_85 (37) = happyShift action_30
    action_85 (39) = happyShift action_31
    action_85 (40) = happyShift action_32
    action_85 (41) = happyShift action_33
    action_85 (42) = happyShift action_34
    action_85 (43) = happyShift action_35
    action_85 (44) = happyShift action_36
    action_85 (45) = happyShift action_37
    action_85 (46) = happyShift action_38
    action_85 (4) = happyGoto action_139
    action_85 _ = happyFail (happyExpListPerState 85)

    action_86 (63) = happyShift action_138
    action_86 _ = happyFail (happyExpListPerState 86)

    action_87 (49) = happyShift action_43
    action_87 (50) = happyShift action_44
    action_87 (51) = happyShift action_45
    action_87 (52) = happyShift action_46
    action_87 (53) = happyShift action_47
    action_87 (54) = happyShift action_48
    action_87 (55) = happyShift action_49
    action_87 (56) = happyShift action_50
    action_87 (57) = happyShift action_51
    action_87 (58) = happyShift action_52
    action_87 (59) = happyShift action_53
    action_87 (60) = happyShift action_54
    action_87 (61) = happyShift action_55
    action_87 (62) = happyShift action_56
    action_87 (64) = happyShift action_57
    action_87 (66) = happyShift action_58
    action_87 (5) = happyGoto action_137
    action_87 _ = happyFail (happyExpListPerState 87)

    action_88 (49) = happyShift action_43
    action_88 (50) = happyShift action_44
    action_88 (51) = happyShift action_45
    action_88 (52) = happyShift action_46
    action_88 (53) = happyShift action_47
    action_88 (54) = happyShift action_48
    action_88 (55) = happyShift action_49
    action_88 (56) = happyShift action_50
    action_88 (57) = happyShift action_51
    action_88 (58) = happyShift action_52
    action_88 (59) = happyShift action_53
    action_88 (60) = happyShift action_54
    action_88 (61) = happyShift action_55
    action_88 (62) = happyShift action_56
    action_88 (64) = happyShift action_57
    action_88 (66) = happyShift action_58
    action_88 (5) = happyGoto action_136
    action_88 _ = happyFail (happyExpListPerState 88)

    action_89 (76) = happyShift action_93
    action_89 (77) = happyShift action_94
    action_89 _ = happyReduce_70

    action_90 (67) = happyShift action_124
    action_90 (70) = happyShift action_95
    action_90 (71) = happyShift action_96
    action_90 (72) = happyShift action_97
    action_90 (73) = happyShift action_98
    action_90 (74) = happyShift action_99
    action_90 (75) = happyShift action_100
    action_90 _ = happyFail (happyExpListPerState 90)

    action_91 (67) = happyShift action_135
    action_91 (76) = happyShift action_93
    action_91 (77) = happyShift action_94
    action_91 _ = happyFail (happyExpListPerState 91)

    action_92 (10) = happyShift action_3
    action_92 (11) = happyShift action_4
    action_92 (12) = happyShift action_5
    action_92 (13) = happyShift action_6
    action_92 (14) = happyShift action_7
    action_92 (15) = happyShift action_8
    action_92 (16) = happyShift action_9
    action_92 (17) = happyShift action_10
    action_92 (18) = happyShift action_11
    action_92 (19) = happyShift action_12
    action_92 (20) = happyShift action_13
    action_92 (21) = happyShift action_14
    action_92 (22) = happyShift action_15
    action_92 (23) = happyShift action_16
    action_92 (24) = happyShift action_17
    action_92 (25) = happyShift action_18
    action_92 (26) = happyShift action_19
    action_92 (27) = happyShift action_20
    action_92 (28) = happyShift action_21
    action_92 (29) = happyShift action_22
    action_92 (30) = happyShift action_23
    action_92 (31) = happyShift action_24
    action_92 (32) = happyShift action_25
    action_92 (33) = happyShift action_26
    action_92 (34) = happyShift action_27
    action_92 (35) = happyShift action_28
    action_92 (36) = happyShift action_29
    action_92 (37) = happyShift action_30
    action_92 (39) = happyShift action_31
    action_92 (40) = happyShift action_32
    action_92 (41) = happyShift action_33
    action_92 (42) = happyShift action_34
    action_92 (43) = happyShift action_35
    action_92 (44) = happyShift action_36
    action_92 (45) = happyShift action_37
    action_92 (46) = happyShift action_38
    action_92 (4) = happyGoto action_134
    action_92 _ = happyFail (happyExpListPerState 92)

    action_93 (49) = happyShift action_43
    action_93 (50) = happyShift action_44
    action_93 (51) = happyShift action_45
    action_93 (52) = happyShift action_46
    action_93 (53) = happyShift action_47
    action_93 (54) = happyShift action_48
    action_93 (55) = happyShift action_49
    action_93 (56) = happyShift action_50
    action_93 (57) = happyShift action_51
    action_93 (58) = happyShift action_52
    action_93 (59) = happyShift action_53
    action_93 (60) = happyShift action_54
    action_93 (61) = happyShift action_55
    action_93 (62) = happyShift action_56
    action_93 (64) = happyShift action_57
    action_93 (66) = happyShift action_62
    action_93 (78) = happyShift action_63
    action_93 (5) = happyGoto action_60
    action_93 (9) = happyGoto action_133
    action_93 _ = happyFail (happyExpListPerState 93)

    action_94 (49) = happyShift action_43
    action_94 (50) = happyShift action_44
    action_94 (51) = happyShift action_45
    action_94 (52) = happyShift action_46
    action_94 (53) = happyShift action_47
    action_94 (54) = happyShift action_48
    action_94 (55) = happyShift action_49
    action_94 (56) = happyShift action_50
    action_94 (57) = happyShift action_51
    action_94 (58) = happyShift action_52
    action_94 (59) = happyShift action_53
    action_94 (60) = happyShift action_54
    action_94 (61) = happyShift action_55
    action_94 (62) = happyShift action_56
    action_94 (64) = happyShift action_57
    action_94 (66) = happyShift action_62
    action_94 (78) = happyShift action_63
    action_94 (5) = happyGoto action_60
    action_94 (9) = happyGoto action_132
    action_94 _ = happyFail (happyExpListPerState 94)

    action_95 (49) = happyShift action_43
    action_95 (50) = happyShift action_44
    action_95 (51) = happyShift action_45
    action_95 (52) = happyShift action_46
    action_95 (53) = happyShift action_47
    action_95 (54) = happyShift action_48
    action_95 (55) = happyShift action_49
    action_95 (56) = happyShift action_50
    action_95 (57) = happyShift action_51
    action_95 (58) = happyShift action_52
    action_95 (59) = happyShift action_53
    action_95 (60) = happyShift action_54
    action_95 (61) = happyShift action_55
    action_95 (62) = happyShift action_56
    action_95 (64) = happyShift action_57
    action_95 (66) = happyShift action_58
    action_95 (5) = happyGoto action_131
    action_95 _ = happyFail (happyExpListPerState 95)

    action_96 (49) = happyShift action_43
    action_96 (50) = happyShift action_44
    action_96 (51) = happyShift action_45
    action_96 (52) = happyShift action_46
    action_96 (53) = happyShift action_47
    action_96 (54) = happyShift action_48
    action_96 (55) = happyShift action_49
    action_96 (56) = happyShift action_50
    action_96 (57) = happyShift action_51
    action_96 (58) = happyShift action_52
    action_96 (59) = happyShift action_53
    action_96 (60) = happyShift action_54
    action_96 (61) = happyShift action_55
    action_96 (62) = happyShift action_56
    action_96 (64) = happyShift action_57
    action_96 (66) = happyShift action_58
    action_96 (5) = happyGoto action_130
    action_96 _ = happyFail (happyExpListPerState 96)

    action_97 (49) = happyShift action_43
    action_97 (50) = happyShift action_44
    action_97 (51) = happyShift action_45
    action_97 (52) = happyShift action_46
    action_97 (53) = happyShift action_47
    action_97 (54) = happyShift action_48
    action_97 (55) = happyShift action_49
    action_97 (56) = happyShift action_50
    action_97 (57) = happyShift action_51
    action_97 (58) = happyShift action_52
    action_97 (59) = happyShift action_53
    action_97 (60) = happyShift action_54
    action_97 (61) = happyShift action_55
    action_97 (62) = happyShift action_56
    action_97 (64) = happyShift action_57
    action_97 (66) = happyShift action_58
    action_97 (5) = happyGoto action_129
    action_97 _ = happyFail (happyExpListPerState 97)

    action_98 (49) = happyShift action_43
    action_98 (50) = happyShift action_44
    action_98 (51) = happyShift action_45
    action_98 (52) = happyShift action_46
    action_98 (53) = happyShift action_47
    action_98 (54) = happyShift action_48
    action_98 (55) = happyShift action_49
    action_98 (56) = happyShift action_50
    action_98 (57) = happyShift action_51
    action_98 (58) = happyShift action_52
    action_98 (59) = happyShift action_53
    action_98 (60) = happyShift action_54
    action_98 (61) = happyShift action_55
    action_98 (62) = happyShift action_56
    action_98 (64) = happyShift action_57
    action_98 (66) = happyShift action_58
    action_98 (5) = happyGoto action_128
    action_98 _ = happyFail (happyExpListPerState 98)

    action_99 (49) = happyShift action_43
    action_99 (50) = happyShift action_44
    action_99 (51) = happyShift action_45
    action_99 (52) = happyShift action_46
    action_99 (53) = happyShift action_47
    action_99 (54) = happyShift action_48
    action_99 (55) = happyShift action_49
    action_99 (56) = happyShift action_50
    action_99 (57) = happyShift action_51
    action_99 (58) = happyShift action_52
    action_99 (59) = happyShift action_53
    action_99 (60) = happyShift action_54
    action_99 (61) = happyShift action_55
    action_99 (62) = happyShift action_56
    action_99 (64) = happyShift action_57
    action_99 (66) = happyShift action_58
    action_99 (5) = happyGoto action_127
    action_99 _ = happyFail (happyExpListPerState 99)

    action_100 (49) = happyShift action_43
    action_100 (50) = happyShift action_44
    action_100 (51) = happyShift action_45
    action_100 (52) = happyShift action_46
    action_100 (53) = happyShift action_47
    action_100 (54) = happyShift action_48
    action_100 (55) = happyShift action_49
    action_100 (56) = happyShift action_50
    action_100 (57) = happyShift action_51
    action_100 (58) = happyShift action_52
    action_100 (59) = happyShift action_53
    action_100 (60) = happyShift action_54
    action_100 (61) = happyShift action_55
    action_100 (62) = happyShift action_56
    action_100 (64) = happyShift action_57
    action_100 (66) = happyShift action_58
    action_100 (5) = happyGoto action_126
    action_100 _ = happyFail (happyExpListPerState 100)

    action_101 (10) = happyShift action_3
    action_101 (11) = happyShift action_4
    action_101 (12) = happyShift action_5
    action_101 (13) = happyShift action_6
    action_101 (14) = happyShift action_7
    action_101 (15) = happyShift action_8
    action_101 (16) = happyShift action_9
    action_101 (17) = happyShift action_10
    action_101 (18) = happyShift action_11
    action_101 (19) = happyShift action_12
    action_101 (20) = happyShift action_13
    action_101 (21) = happyShift action_14
    action_101 (22) = happyShift action_15
    action_101 (23) = happyShift action_16
    action_101 (24) = happyShift action_17
    action_101 (25) = happyShift action_18
    action_101 (26) = happyShift action_19
    action_101 (27) = happyShift action_20
    action_101 (28) = happyShift action_21
    action_101 (29) = happyShift action_22
    action_101 (30) = happyShift action_23
    action_101 (31) = happyShift action_24
    action_101 (32) = happyShift action_25
    action_101 (33) = happyShift action_26
    action_101 (34) = happyShift action_27
    action_101 (35) = happyShift action_28
    action_101 (36) = happyShift action_29
    action_101 (37) = happyShift action_30
    action_101 (39) = happyShift action_31
    action_101 (40) = happyShift action_32
    action_101 (41) = happyShift action_33
    action_101 (42) = happyShift action_34
    action_101 (43) = happyShift action_35
    action_101 (44) = happyShift action_36
    action_101 (45) = happyShift action_37
    action_101 (46) = happyShift action_38
    action_101 (4) = happyGoto action_125
    action_101 _ = happyFail (happyExpListPerState 101)

    action_102 (67) = happyShift action_124
    action_102 _ = happyFail (happyExpListPerState 102)

    action_103 _ = happyReduce_52

    action_104 _ = happyReduce_55

    action_105 (49) = happyShift action_43
    action_105 (50) = happyShift action_44
    action_105 (51) = happyShift action_45
    action_105 (52) = happyShift action_46
    action_105 (53) = happyShift action_47
    action_105 (54) = happyShift action_48
    action_105 (55) = happyShift action_49
    action_105 (56) = happyShift action_50
    action_105 (57) = happyShift action_51
    action_105 (58) = happyShift action_52
    action_105 (59) = happyShift action_53
    action_105 (60) = happyShift action_54
    action_105 (61) = happyShift action_55
    action_105 (62) = happyShift action_56
    action_105 (64) = happyShift action_57
    action_105 (66) = happyShift action_58
    action_105 (5) = happyGoto action_122
    action_105 (7) = happyGoto action_123
    action_105 _ = happyFail (happyExpListPerState 105)

    action_106 (47) = happyShift action_104
    action_106 (48) = happyShift action_105
    action_106 (66) = happyShift action_106
    action_106 (6) = happyGoto action_121
    action_106 _ = happyFail (happyExpListPerState 106)

    action_107 _ = happyReduce_51

    action_108 _ = happyReduce_50

    action_109 (47) = happyShift action_104
    action_109 (48) = happyShift action_105
    action_109 (66) = happyShift action_106
    action_109 (6) = happyGoto action_120
    action_109 _ = happyFail (happyExpListPerState 109)

    action_110 _ = happyReduce_48

    action_111 _ = happyReduce_47

    action_112 (49) = happyShift action_43
    action_112 (50) = happyShift action_44
    action_112 (51) = happyShift action_45
    action_112 (52) = happyShift action_46
    action_112 (53) = happyShift action_47
    action_112 (54) = happyShift action_48
    action_112 (55) = happyShift action_49
    action_112 (56) = happyShift action_50
    action_112 (57) = happyShift action_51
    action_112 (58) = happyShift action_52
    action_112 (59) = happyShift action_53
    action_112 (60) = happyShift action_54
    action_112 (61) = happyShift action_55
    action_112 (62) = happyShift action_56
    action_112 (64) = happyShift action_57
    action_112 (66) = happyShift action_58
    action_112 (5) = happyGoto action_119
    action_112 _ = happyFail (happyExpListPerState 112)

    action_113 (49) = happyShift action_43
    action_113 (50) = happyShift action_44
    action_113 (51) = happyShift action_45
    action_113 (52) = happyShift action_46
    action_113 (53) = happyShift action_47
    action_113 (54) = happyShift action_48
    action_113 (55) = happyShift action_49
    action_113 (56) = happyShift action_50
    action_113 (57) = happyShift action_51
    action_113 (58) = happyShift action_52
    action_113 (59) = happyShift action_53
    action_113 (60) = happyShift action_54
    action_113 (61) = happyShift action_55
    action_113 (62) = happyShift action_56
    action_113 (64) = happyShift action_57
    action_113 (66) = happyShift action_58
    action_113 (5) = happyGoto action_118
    action_113 _ = happyFail (happyExpListPerState 113)

    action_114 _ = happyReduce_44

    action_115 _ = happyReduce_43

    action_116 (10) = happyShift action_3
    action_116 (11) = happyShift action_4
    action_116 (12) = happyShift action_5
    action_116 (13) = happyShift action_6
    action_116 (14) = happyShift action_7
    action_116 (15) = happyShift action_8
    action_116 (16) = happyShift action_9
    action_116 (17) = happyShift action_10
    action_116 (18) = happyShift action_11
    action_116 (19) = happyShift action_12
    action_116 (20) = happyShift action_13
    action_116 (21) = happyShift action_14
    action_116 (22) = happyShift action_15
    action_116 (23) = happyShift action_16
    action_116 (24) = happyShift action_17
    action_116 (25) = happyShift action_18
    action_116 (26) = happyShift action_19
    action_116 (27) = happyShift action_20
    action_116 (28) = happyShift action_21
    action_116 (29) = happyShift action_22
    action_116 (30) = happyShift action_23
    action_116 (31) = happyShift action_24
    action_116 (32) = happyShift action_25
    action_116 (33) = happyShift action_26
    action_116 (34) = happyShift action_27
    action_116 (35) = happyShift action_28
    action_116 (36) = happyShift action_29
    action_116 (37) = happyShift action_30
    action_116 (39) = happyShift action_31
    action_116 (40) = happyShift action_32
    action_116 (41) = happyShift action_33
    action_116 (42) = happyShift action_34
    action_116 (43) = happyShift action_35
    action_116 (44) = happyShift action_36
    action_116 (45) = happyShift action_37
    action_116 (46) = happyShift action_38
    action_116 (69) = happyShift action_117
    action_116 (4) = happyGoto action_40
    action_116 _ = happyFail (happyExpListPerState 116)

    action_117 (49) = happyShift action_43
    action_117 (50) = happyShift action_44
    action_117 (51) = happyShift action_45
    action_117 (52) = happyShift action_46
    action_117 (53) = happyShift action_47
    action_117 (54) = happyShift action_48
    action_117 (55) = happyShift action_49
    action_117 (56) = happyShift action_50
    action_117 (57) = happyShift action_51
    action_117 (58) = happyShift action_52
    action_117 (59) = happyShift action_53
    action_117 (60) = happyShift action_54
    action_117 (61) = happyShift action_55
    action_117 (62) = happyShift action_56
    action_117 (64) = happyShift action_57
    action_117 (66) = happyShift action_62
    action_117 (78) = happyShift action_63
    action_117 (5) = happyGoto action_60
    action_117 (9) = happyGoto action_149
    action_117 _ = happyFail (happyExpListPerState 117)

    action_118 _ = happyReduce_45

    action_119 _ = happyReduce_46

    action_120 _ = happyReduce_49

    action_121 (67) = happyShift action_148
    action_121 _ = happyFail (happyExpListPerState 121)

    action_122 (49) = happyShift action_43
    action_122 (50) = happyShift action_44
    action_122 (51) = happyShift action_45
    action_122 (52) = happyShift action_46
    action_122 (53) = happyShift action_47
    action_122 (54) = happyShift action_48
    action_122 (55) = happyShift action_49
    action_122 (56) = happyShift action_50
    action_122 (57) = happyShift action_51
    action_122 (58) = happyShift action_52
    action_122 (59) = happyShift action_53
    action_122 (60) = happyShift action_54
    action_122 (61) = happyShift action_55
    action_122 (62) = happyShift action_56
    action_122 (64) = happyShift action_57
    action_122 (66) = happyShift action_58
    action_122 (5) = happyGoto action_122
    action_122 (7) = happyGoto action_147
    action_122 _ = happyReduce_59

    action_123 _ = happyReduce_56

    action_124 _ = happyReduce_54

    action_125 (10) = happyShift action_3
    action_125 (11) = happyShift action_4
    action_125 (12) = happyShift action_5
    action_125 (13) = happyShift action_6
    action_125 (14) = happyShift action_7
    action_125 (15) = happyShift action_8
    action_125 (16) = happyShift action_9
    action_125 (17) = happyShift action_10
    action_125 (18) = happyShift action_11
    action_125 (19) = happyShift action_12
    action_125 (20) = happyShift action_13
    action_125 (21) = happyShift action_14
    action_125 (22) = happyShift action_15
    action_125 (23) = happyShift action_16
    action_125 (24) = happyShift action_17
    action_125 (25) = happyShift action_18
    action_125 (26) = happyShift action_19
    action_125 (27) = happyShift action_20
    action_125 (28) = happyShift action_21
    action_125 (29) = happyShift action_22
    action_125 (30) = happyShift action_23
    action_125 (31) = happyShift action_24
    action_125 (32) = happyShift action_25
    action_125 (33) = happyShift action_26
    action_125 (34) = happyShift action_27
    action_125 (35) = happyShift action_28
    action_125 (36) = happyShift action_29
    action_125 (37) = happyShift action_30
    action_125 (39) = happyShift action_31
    action_125 (40) = happyShift action_32
    action_125 (41) = happyShift action_33
    action_125 (42) = happyShift action_34
    action_125 (43) = happyShift action_35
    action_125 (44) = happyShift action_36
    action_125 (45) = happyShift action_37
    action_125 (46) = happyShift action_38
    action_125 (69) = happyShift action_146
    action_125 (4) = happyGoto action_40
    action_125 _ = happyFail (happyExpListPerState 125)

    action_126 _ = happyReduce_67

    action_127 _ = happyReduce_65

    action_128 _ = happyReduce_66

    action_129 _ = happyReduce_64

    action_130 _ = happyReduce_63

    action_131 _ = happyReduce_62

    action_132 (76) = happyShift action_93
    action_132 _ = happyReduce_69

    action_133 _ = happyReduce_68

    action_134 (10) = happyShift action_3
    action_134 (11) = happyShift action_4
    action_134 (12) = happyShift action_5
    action_134 (13) = happyShift action_6
    action_134 (14) = happyShift action_7
    action_134 (15) = happyShift action_8
    action_134 (16) = happyShift action_9
    action_134 (17) = happyShift action_10
    action_134 (18) = happyShift action_11
    action_134 (19) = happyShift action_12
    action_134 (20) = happyShift action_13
    action_134 (21) = happyShift action_14
    action_134 (22) = happyShift action_15
    action_134 (23) = happyShift action_16
    action_134 (24) = happyShift action_17
    action_134 (25) = happyShift action_18
    action_134 (26) = happyShift action_19
    action_134 (27) = happyShift action_20
    action_134 (28) = happyShift action_21
    action_134 (29) = happyShift action_22
    action_134 (30) = happyShift action_23
    action_134 (31) = happyShift action_24
    action_134 (32) = happyShift action_25
    action_134 (33) = happyShift action_26
    action_134 (34) = happyShift action_27
    action_134 (35) = happyShift action_28
    action_134 (36) = happyShift action_29
    action_134 (37) = happyShift action_30
    action_134 (39) = happyShift action_31
    action_134 (40) = happyShift action_32
    action_134 (41) = happyShift action_33
    action_134 (42) = happyShift action_34
    action_134 (43) = happyShift action_35
    action_134 (44) = happyShift action_36
    action_134 (45) = happyShift action_37
    action_134 (46) = happyShift action_38
    action_134 (69) = happyShift action_145
    action_134 (4) = happyGoto action_40
    action_134 _ = happyFail (happyExpListPerState 134)

    action_135 _ = happyReduce_71

    action_136 (49) = happyShift action_43
    action_136 (50) = happyShift action_44
    action_136 (51) = happyShift action_45
    action_136 (52) = happyShift action_46
    action_136 (53) = happyShift action_47
    action_136 (54) = happyShift action_48
    action_136 (55) = happyShift action_49
    action_136 (56) = happyShift action_50
    action_136 (57) = happyShift action_51
    action_136 (58) = happyShift action_52
    action_136 (59) = happyShift action_53
    action_136 (60) = happyShift action_54
    action_136 (61) = happyShift action_55
    action_136 (62) = happyShift action_56
    action_136 (64) = happyShift action_57
    action_136 (66) = happyShift action_58
    action_136 (5) = happyGoto action_144
    action_136 _ = happyFail (happyExpListPerState 136)

    action_137 _ = happyReduce_31

    action_138 (53) = happyShift action_86
    action_138 (8) = happyGoto action_143
    action_138 _ = happyReduce_61

    action_139 (10) = happyShift action_3
    action_139 (11) = happyShift action_4
    action_139 (12) = happyShift action_5
    action_139 (13) = happyShift action_6
    action_139 (14) = happyShift action_7
    action_139 (15) = happyShift action_8
    action_139 (16) = happyShift action_9
    action_139 (17) = happyShift action_10
    action_139 (18) = happyShift action_11
    action_139 (19) = happyShift action_12
    action_139 (20) = happyShift action_13
    action_139 (21) = happyShift action_14
    action_139 (22) = happyShift action_15
    action_139 (23) = happyShift action_16
    action_139 (24) = happyShift action_17
    action_139 (25) = happyShift action_18
    action_139 (26) = happyShift action_19
    action_139 (27) = happyShift action_20
    action_139 (28) = happyShift action_21
    action_139 (29) = happyShift action_22
    action_139 (30) = happyShift action_23
    action_139 (31) = happyShift action_24
    action_139 (32) = happyShift action_25
    action_139 (33) = happyShift action_26
    action_139 (34) = happyShift action_27
    action_139 (35) = happyShift action_28
    action_139 (36) = happyShift action_29
    action_139 (37) = happyShift action_30
    action_139 (38) = happyShift action_142
    action_139 (39) = happyShift action_31
    action_139 (40) = happyShift action_32
    action_139 (41) = happyShift action_33
    action_139 (42) = happyShift action_34
    action_139 (43) = happyShift action_35
    action_139 (44) = happyShift action_36
    action_139 (45) = happyShift action_37
    action_139 (46) = happyShift action_38
    action_139 (4) = happyGoto action_40
    action_139 _ = happyFail (happyExpListPerState 139)

    action_140 (10) = happyShift action_3
    action_140 (11) = happyShift action_4
    action_140 (12) = happyShift action_5
    action_140 (13) = happyShift action_6
    action_140 (14) = happyShift action_7
    action_140 (15) = happyShift action_8
    action_140 (16) = happyShift action_9
    action_140 (17) = happyShift action_10
    action_140 (18) = happyShift action_11
    action_140 (19) = happyShift action_12
    action_140 (20) = happyShift action_13
    action_140 (21) = happyShift action_14
    action_140 (22) = happyShift action_15
    action_140 (23) = happyShift action_16
    action_140 (24) = happyShift action_17
    action_140 (25) = happyShift action_18
    action_140 (26) = happyShift action_19
    action_140 (27) = happyShift action_20
    action_140 (28) = happyShift action_21
    action_140 (29) = happyShift action_22
    action_140 (30) = happyShift action_23
    action_140 (31) = happyShift action_24
    action_140 (32) = happyShift action_25
    action_140 (33) = happyShift action_26
    action_140 (34) = happyShift action_27
    action_140 (35) = happyShift action_28
    action_140 (36) = happyShift action_29
    action_140 (37) = happyShift action_30
    action_140 (39) = happyShift action_31
    action_140 (40) = happyShift action_32
    action_140 (41) = happyShift action_33
    action_140 (42) = happyShift action_34
    action_140 (43) = happyShift action_35
    action_140 (44) = happyShift action_36
    action_140 (45) = happyShift action_37
    action_140 (46) = happyShift action_38
    action_140 (69) = happyShift action_141
    action_140 (4) = happyGoto action_40
    action_140 _ = happyFail (happyExpListPerState 140)

    action_141 _ = happyReduce_27

    action_142 _ = happyReduce_29

    action_143 _ = happyReduce_60

    action_144 (49) = happyShift action_43
    action_144 (50) = happyShift action_44
    action_144 (51) = happyShift action_45
    action_144 (52) = happyShift action_46
    action_144 (53) = happyShift action_47
    action_144 (54) = happyShift action_48
    action_144 (55) = happyShift action_49
    action_144 (56) = happyShift action_50
    action_144 (57) = happyShift action_51
    action_144 (58) = happyShift action_52
    action_144 (59) = happyShift action_53
    action_144 (60) = happyShift action_54
    action_144 (61) = happyShift action_55
    action_144 (62) = happyShift action_56
    action_144 (64) = happyShift action_57
    action_144 (66) = happyShift action_58
    action_144 (69) = happyShift action_151
    action_144 (5) = happyGoto action_150
    action_144 _ = happyFail (happyExpListPerState 144)

    action_145 _ = happyReduce_34

    action_146 _ = happyReduce_36

    action_147 _ = happyReduce_58

    action_148 _ = happyReduce_57

    action_149 (76) = happyShift action_93
    action_149 (77) = happyShift action_94
    action_149 _ = happyReduce_38

    action_150 (69) = happyShift action_153
    action_150 _ = happyFail (happyExpListPerState 150)

    action_151 (68) = happyShift action_152
    action_151 _ = happyFail (happyExpListPerState 151)

    action_152 (10) = happyShift action_3
    action_152 (11) = happyShift action_4
    action_152 (12) = happyShift action_5
    action_152 (13) = happyShift action_6
    action_152 (14) = happyShift action_7
    action_152 (15) = happyShift action_8
    action_152 (16) = happyShift action_9
    action_152 (17) = happyShift action_10
    action_152 (18) = happyShift action_11
    action_152 (19) = happyShift action_12
    action_152 (20) = happyShift action_13
    action_152 (21) = happyShift action_14
    action_152 (22) = happyShift action_15
    action_152 (23) = happyShift action_16
    action_152 (24) = happyShift action_17
    action_152 (25) = happyShift action_18
    action_152 (26) = happyShift action_19
    action_152 (27) = happyShift action_20
    action_152 (28) = happyShift action_21
    action_152 (29) = happyShift action_22
    action_152 (30) = happyShift action_23
    action_152 (31) = happyShift action_24
    action_152 (32) = happyShift action_25
    action_152 (33) = happyShift action_26
    action_152 (34) = happyShift action_27
    action_152 (35) = happyShift action_28
    action_152 (36) = happyShift action_29
    action_152 (37) = happyShift action_30
    action_152 (39) = happyShift action_31
    action_152 (40) = happyShift action_32
    action_152 (41) = happyShift action_33
    action_152 (42) = happyShift action_34
    action_152 (43) = happyShift action_35
    action_152 (44) = happyShift action_36
    action_152 (45) = happyShift action_37
    action_152 (46) = happyShift action_38
    action_152 (4) = happyGoto action_155
    action_152 _ = happyFail (happyExpListPerState 152)

    action_153 (68) = happyShift action_154
    action_153 _ = happyFail (happyExpListPerState 153)

    action_154 (10) = happyShift action_3
    action_154 (11) = happyShift action_4
    action_154 (12) = happyShift action_5
    action_154 (13) = happyShift action_6
    action_154 (14) = happyShift action_7
    action_154 (15) = happyShift action_8
    action_154 (16) = happyShift action_9
    action_154 (17) = happyShift action_10
    action_154 (18) = happyShift action_11
    action_154 (19) = happyShift action_12
    action_154 (20) = happyShift action_13
    action_154 (21) = happyShift action_14
    action_154 (22) = happyShift action_15
    action_154 (23) = happyShift action_16
    action_154 (24) = happyShift action_17
    action_154 (25) = happyShift action_18
    action_154 (26) = happyShift action_19
    action_154 (27) = happyShift action_20
    action_154 (28) = happyShift action_21
    action_154 (29) = happyShift action_22
    action_154 (30) = happyShift action_23
    action_154 (31) = happyShift action_24
    action_154 (32) = happyShift action_25
    action_154 (33) = happyShift action_26
    action_154 (34) = happyShift action_27
    action_154 (35) = happyShift action_28
    action_154 (36) = happyShift action_29
    action_154 (37) = happyShift action_30
    action_154 (39) = happyShift action_31
    action_154 (40) = happyShift action_32
    action_154 (41) = happyShift action_33
    action_154 (42) = happyShift action_34
    action_154 (43) = happyShift action_35
    action_154 (44) = happyShift action_36
    action_154 (45) = happyShift action_37
    action_154 (46) = happyShift action_38
    action_154 (4) = happyGoto action_157
    action_154 _ = happyFail (happyExpListPerState 154)

    action_155 (10) = happyShift action_3
    action_155 (11) = happyShift action_4
    action_155 (12) = happyShift action_5
    action_155 (13) = happyShift action_6
    action_155 (14) = happyShift action_7
    action_155 (15) = happyShift action_8
    action_155 (16) = happyShift action_9
    action_155 (17) = happyShift action_10
    action_155 (18) = happyShift action_11
    action_155 (19) = happyShift action_12
    action_155 (20) = happyShift action_13
    action_155 (21) = happyShift action_14
    action_155 (22) = happyShift action_15
    action_155 (23) = happyShift action_16
    action_155 (24) = happyShift action_17
    action_155 (25) = happyShift action_18
    action_155 (26) = happyShift action_19
    action_155 (27) = happyShift action_20
    action_155 (28) = happyShift action_21
    action_155 (29) = happyShift action_22
    action_155 (30) = happyShift action_23
    action_155 (31) = happyShift action_24
    action_155 (32) = happyShift action_25
    action_155 (33) = happyShift action_26
    action_155 (34) = happyShift action_27
    action_155 (35) = happyShift action_28
    action_155 (36) = happyShift action_29
    action_155 (37) = happyShift action_30
    action_155 (39) = happyShift action_31
    action_155 (40) = happyShift action_32
    action_155 (41) = happyShift action_33
    action_155 (42) = happyShift action_34
    action_155 (43) = happyShift action_35
    action_155 (44) = happyShift action_36
    action_155 (45) = happyShift action_37
    action_155 (46) = happyShift action_38
    action_155 (69) = happyShift action_156
    action_155 (4) = happyGoto action_40
    action_155 _ = happyFail (happyExpListPerState 155)

    action_156 _ = happyReduce_32

    action_157 (10) = happyShift action_3
    action_157 (11) = happyShift action_4
    action_157 (12) = happyShift action_5
    action_157 (13) = happyShift action_6
    action_157 (14) = happyShift action_7
    action_157 (15) = happyShift action_8
    action_157 (16) = happyShift action_9
    action_157 (17) = happyShift action_10
    action_157 (18) = happyShift action_11
    action_157 (19) = happyShift action_12
    action_157 (20) = happyShift action_13
    action_157 (21) = happyShift action_14
    action_157 (22) = happyShift action_15
    action_157 (23) = happyShift action_16
    action_157 (24) = happyShift action_17
    action_157 (25) = happyShift action_18
    action_157 (26) = happyShift action_19
    action_157 (27) = happyShift action_20
    action_157 (28) = happyShift action_21
    action_157 (29) = happyShift action_22
    action_157 (30) = happyShift action_23
    action_157 (31) = happyShift action_24
    action_157 (32) = happyShift action_25
    action_157 (33) = happyShift action_26
    action_157 (34) = happyShift action_27
    action_157 (35) = happyShift action_28
    action_157 (36) = happyShift action_29
    action_157 (37) = happyShift action_30
    action_157 (39) = happyShift action_31
    action_157 (40) = happyShift action_32
    action_157 (41) = happyShift action_33
    action_157 (42) = happyShift action_34
    action_157 (43) = happyShift action_35
    action_157 (44) = happyShift action_36
    action_157 (45) = happyShift action_37
    action_157 (46) = happyShift action_38
    action_157 (69) = happyShift action_158
    action_157 (4) = happyGoto action_40
    action_157 _ = happyFail (happyExpListPerState 157)

    action_158 _ = happyReduce_33

    happyReduce_1 = happySpecReduce_2  4 happyReduction_1
    happyReduction_1 (HappyAbsSyn4  happy_var_2)
      (HappyAbsSyn4  happy_var_1)
      =  HappyAbsSyn4
        (Sec happy_var_1 happy_var_2
      )
    happyReduction_1 _ _  = notHappyAtAll 

    happyReduce_2 = happySpecReduce_2  4 happyReduction_2
    happyReduction_2 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Ford happy_var_2
      )
    happyReduction_2 _ _  = notHappyAtAll 

    happyReduce_3 = happySpecReduce_2  4 happyReduction_3
    happyReduction_3 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Ford happy_var_2
      )
    happyReduction_3 _ _  = notHappyAtAll 

    happyReduce_4 = happySpecReduce_2  4 happyReduction_4
    happyReduction_4 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Back happy_var_2
      )
    happyReduction_4 _ _  = notHappyAtAll 

    happyReduce_5 = happySpecReduce_2  4 happyReduction_5
    happyReduction_5 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Back happy_var_2
      )
    happyReduction_5 _ _  = notHappyAtAll 

    happyReduce_6 = happySpecReduce_2  4 happyReduction_6
    happyReduction_6 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Right happy_var_2
      )
    happyReduction_6 _ _  = notHappyAtAll 

    happyReduce_7 = happySpecReduce_2  4 happyReduction_7
    happyReduction_7 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Right happy_var_2
      )
    happyReduction_7 _ _  = notHappyAtAll 

    happyReduce_8 = happySpecReduce_2  4 happyReduction_8
    happyReduction_8 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Left happy_var_2
      )
    happyReduction_8 _ _  = notHappyAtAll 

    happyReduce_9 = happySpecReduce_2  4 happyReduction_9
    happyReduction_9 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Left happy_var_2
      )
    happyReduction_9 _ _  = notHappyAtAll 

    happyReduce_10 = happySpecReduce_1  4 happyReduction_10
    happyReduction_10 _
      =  HappyAbsSyn4
        (Clear
      )

    happyReduce_11 = happySpecReduce_1  4 happyReduction_11
    happyReduction_11 _
      =  HappyAbsSyn4
        (Clear
      )

    happyReduce_12 = happySpecReduce_1  4 happyReduction_12
    happyReduction_12 _
      =  HappyAbsSyn4
        (Clean
      )

    happyReduce_13 = happySpecReduce_1  4 happyReduction_13
    happyReduction_13 _
      =  HappyAbsSyn4
        (PUp
      )

    happyReduce_14 = happySpecReduce_1  4 happyReduction_14
    happyReduction_14 _
      =  HappyAbsSyn4
        (PUp
      )

    happyReduce_15 = happySpecReduce_1  4 happyReduction_15
    happyReduction_15 _
      =  HappyAbsSyn4
        (PDown
      )

    happyReduce_16 = happySpecReduce_1  4 happyReduction_16
    happyReduction_16 _
      =  HappyAbsSyn4
        (PDown
      )

    happyReduce_17 = happySpecReduce_1  4 happyReduction_17
    happyReduction_17 _
      =  HappyAbsSyn4
        (HideT
      )

    happyReduce_18 = happySpecReduce_1  4 happyReduction_18
    happyReduction_18 _
      =  HappyAbsSyn4
        (HideT
      )

    happyReduce_19 = happySpecReduce_1  4 happyReduction_19
    happyReduction_19 _
      =  HappyAbsSyn4
        (ShowT
      )

    happyReduce_20 = happySpecReduce_1  4 happyReduction_20
    happyReduction_20 _
      =  HappyAbsSyn4
        (ShowT
      )

    happyReduce_21 = happySpecReduce_1  4 happyReduction_21
    happyReduction_21 _
      =  HappyAbsSyn4
        (Home
      )

    happyReduce_22 = happySpecReduce_2  4 happyReduction_22
    happyReduction_22 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (SetX happy_var_2
      )
    happyReduction_22 _ _  = notHappyAtAll 

    happyReduce_23 = happySpecReduce_2  4 happyReduction_23
    happyReduction_23 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (SetY happy_var_2
      )
    happyReduction_23 _ _  = notHappyAtAll 

    happyReduce_24 = happySpecReduce_3  4 happyReduction_24
    happyReduction_24 (HappyAbsSyn5  happy_var_3)
      (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (SetXY happy_var_2 happy_var_3
      )
    happyReduction_24 _ _ _  = notHappyAtAll 

    happyReduce_25 = happySpecReduce_2  4 happyReduction_25
    happyReduction_25 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (SetHead happy_var_2
      )
    happyReduction_25 _ _  = notHappyAtAll 

    happyReduce_26 = happySpecReduce_2  4 happyReduction_26
    happyReduction_26 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (SetHead happy_var_2
      )
    happyReduction_26 _ _  = notHappyAtAll 

    happyReduce_27 = happyReduce 5 4 happyReduction_27
    happyReduction_27 (_ `HappyStk`
      (HappyAbsSyn4  happy_var_4) `HappyStk`
      _ `HappyStk`
      (HappyAbsSyn5  happy_var_2) `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (Rep happy_var_2 happy_var_4
      ) `HappyStk` happyRest

    happyReduce_28 = happySpecReduce_2  4 happyReduction_28
    happyReduction_28 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Print happy_var_2
      )
    happyReduction_28 _ _  = notHappyAtAll 

    happyReduce_29 = happyReduce 5 4 happyReduction_29
    happyReduction_29 (_ `HappyStk`
      (HappyAbsSyn4  happy_var_4) `HappyStk`
      (HappyAbsSyn8  happy_var_3) `HappyStk`
      (HappyTerminal (TokenVar happy_var_2)) `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (Def happy_var_2 happy_var_3 happy_var_4
      ) `HappyStk` happyRest

    happyReduce_30 = happySpecReduce_2  4 happyReduction_30
    happyReduction_30 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (SetCo happy_var_2
      )
    happyReduction_30 _ _  = notHappyAtAll 

    happyReduce_31 = happyReduce 4 4 happyReduction_31
    happyReduction_31 (_ `HappyStk`
      (HappyTerminal (TokenVar happy_var_3)) `HappyStk`
      (HappyTerminal happy_var_2) `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (DefV happy_var_2 happy_var_3
      ) `HappyStk` happyRest

    happyReduce_32 = happyReduce 9 4 happyReduction_32
    happyReduction_32 (_ `HappyStk`
      (HappyAbsSyn4  happy_var_8) `HappyStk`
      _ `HappyStk`
      _ `HappyStk`
      (HappyAbsSyn5  happy_var_5) `HappyStk`
      (HappyAbsSyn5  happy_var_4) `HappyStk`
      (HappyTerminal (TokenVar happy_var_3)) `HappyStk`
      _ `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (For happy_var_3 happy_var_4 happy_var_5 happy_var_8
      ) `HappyStk` happyRest

    happyReduce_33 = happyReduce 10 4 happyReduction_33
    happyReduction_33 (_ `HappyStk`
      (HappyAbsSyn4  happy_var_9) `HappyStk`
      _ `HappyStk`
      _ `HappyStk`
      (HappyAbsSyn5  happy_var_6) `HappyStk`
      (HappyAbsSyn5  happy_var_5) `HappyStk`
      (HappyAbsSyn5  happy_var_4) `HappyStk`
      (HappyTerminal (TokenVar happy_var_3)) `HappyStk`
      _ `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (ForDelta happy_var_3 happy_var_4 happy_var_5 happy_var_6 happy_var_9
      ) `HappyStk` happyRest

    happyReduce_34 = happyReduce 5 4 happyReduction_34
    happyReduction_34 (_ `HappyStk`
      (HappyAbsSyn4  happy_var_4) `HappyStk`
      _ `HappyStk`
      (HappyAbsSyn9  happy_var_2) `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (If happy_var_2 happy_var_4
      ) `HappyStk` happyRest

    happyReduce_35 = happySpecReduce_1  4 happyReduction_35
    happyReduction_35 _
      =  HappyAbsSyn4
        (Fill
      )

    happyReduce_36 = happyReduce 5 4 happyReduction_36
    happyReduction_36 (_ `HappyStk`
      (HappyAbsSyn4  happy_var_4) `HappyStk`
      _ `HappyStk`
      (HappyAbsSyn5  happy_var_2) `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (Filled happy_var_2 happy_var_4
      ) `HappyStk` happyRest

    happyReduce_37 = happySpecReduce_2  4 happyReduction_37
    happyReduction_37 (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn4
        (Wait happy_var_2
      )
    happyReduction_37 _ _  = notHappyAtAll 

    happyReduce_38 = happyReduce 5 4 happyReduction_38
    happyReduction_38 ((HappyAbsSyn9  happy_var_5) `HappyStk`
      _ `HappyStk`
      (HappyAbsSyn4  happy_var_3) `HappyStk`
      _ `HappyStk`
      _ `HappyStk`
      happyRest)
      = HappyAbsSyn4
        (While happy_var_3 happy_var_5
      ) `HappyStk` happyRest

    happyReduce_39 = happySpecReduce_1  5 happyReduction_39
    happyReduction_39 (HappyTerminal (TokenNum happy_var_1))
      =  HappyAbsSyn5
        (Num happy_var_1
      )
    happyReduction_39 _  = notHappyAtAll 

    happyReduce_40 = happySpecReduce_1  5 happyReduction_40
    happyReduction_40 _
      =  HappyAbsSyn5
        (XCor
      )

    happyReduce_41 = happySpecReduce_1  5 happyReduction_41
    happyReduction_41 _
      =  HappyAbsSyn5
        (YCor
      )

    happyReduce_42 = happySpecReduce_1  5 happyReduction_42
    happyReduction_42 _
      =  HappyAbsSyn5
        (Heading
      )

    happyReduce_43 = happySpecReduce_2  5 happyReduction_43
    happyReduction_43 (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn5
        (Towards happy_var_2
      )
    happyReduction_43 _ _  = notHappyAtAll 

    happyReduce_44 = happySpecReduce_2  5 happyReduction_44
    happyReduction_44 (HappyTerminal (TokenVar happy_var_2))
      _
      =  HappyAbsSyn5
        (Var happy_var_2
      )
    happyReduction_44 _ _  = notHappyAtAll 

    happyReduce_45 = happySpecReduce_3  5 happyReduction_45
    happyReduction_45 (HappyAbsSyn5  happy_var_3)
      (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn5
        (Sum happy_var_2 happy_var_3
      )
    happyReduction_45 _ _ _  = notHappyAtAll 

    happyReduce_46 = happySpecReduce_3  5 happyReduction_46
    happyReduction_46 (HappyAbsSyn5  happy_var_3)
      (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn5
        (Difference happy_var_2 happy_var_3
      )
    happyReduction_46 _ _ _  = notHappyAtAll 

    happyReduce_47 = happySpecReduce_2  5 happyReduction_47
    happyReduction_47 (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn5
        (First happy_var_2
      )
    happyReduction_47 _ _  = notHappyAtAll 

    happyReduce_48 = happySpecReduce_2  5 happyReduction_48
    happyReduction_48 (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn5
        (Last happy_var_2
      )
    happyReduction_48 _ _  = notHappyAtAll 

    happyReduce_49 = happySpecReduce_3  5 happyReduction_49
    happyReduction_49 (HappyAbsSyn6  happy_var_3)
      (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn5
        (Item happy_var_2 happy_var_3
      )
    happyReduction_49 _ _ _  = notHappyAtAll 

    happyReduce_50 = happySpecReduce_2  5 happyReduction_50
    happyReduction_50 (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn5
        (RandItem happy_var_2
      )
    happyReduction_50 _ _  = notHappyAtAll 

    happyReduce_51 = happySpecReduce_2  5 happyReduction_51
    happyReduction_51 (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn5
        (Tail happy_var_2
      )
    happyReduction_51 _ _  = notHappyAtAll 

    happyReduce_52 = happySpecReduce_2  5 happyReduction_52
    happyReduction_52 (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn5
        (RTail happy_var_2
      )
    happyReduction_52 _ _  = notHappyAtAll 

    happyReduce_53 = happySpecReduce_1  5 happyReduction_53
    happyReduction_53 _
      =  HappyAbsSyn5
        (Read
      )

    happyReduce_54 = happySpecReduce_3  5 happyReduction_54
    happyReduction_54 _
      (HappyAbsSyn5  happy_var_2)
      _
      =  HappyAbsSyn5
        (happy_var_2
      )
    happyReduction_54 _ _ _  = notHappyAtAll 

    happyReduce_55 = happySpecReduce_1  6 happyReduction_55
    happyReduction_55 _
      =  HappyAbsSyn6
        (Pos
      )

    happyReduce_56 = happySpecReduce_2  6 happyReduction_56
    happyReduction_56 (HappyAbsSyn7  happy_var_2)
      _
      =  HappyAbsSyn6
        (L happy_var_2
      )
    happyReduction_56 _ _  = notHappyAtAll 

    happyReduce_57 = happySpecReduce_3  6 happyReduction_57
    happyReduction_57 _
      (HappyAbsSyn6  happy_var_2)
      _
      =  HappyAbsSyn6
        (happy_var_2
      )
    happyReduction_57 _ _ _  = notHappyAtAll 

    happyReduce_58 = happySpecReduce_2  7 happyReduction_58
    happyReduction_58 (HappyAbsSyn7  happy_var_2)
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn7
        (happy_var_1 : happy_var_2
      )
    happyReduction_58 _ _  = notHappyAtAll 

    happyReduce_59 = happySpecReduce_1  7 happyReduction_59
    happyReduction_59 (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn7
        ([happy_var_1]
      )
    happyReduction_59 _  = notHappyAtAll 

    happyReduce_60 = happySpecReduce_3  8 happyReduction_60
    happyReduction_60 (HappyAbsSyn8  happy_var_3)
      (HappyTerminal (TokenVar happy_var_2))
      _
      =  HappyAbsSyn8
        (happy_var_2 : happy_var_3
      )
    happyReduction_60 _ _ _  = notHappyAtAll 

    happyReduce_61 = happySpecReduce_2  8 happyReduction_61
    happyReduction_61 (HappyTerminal (TokenVar happy_var_2))
      _
      =  HappyAbsSyn8
        ([happy_var_2]
      )
    happyReduction_61 _ _  = notHappyAtAll 

    happyReduce_62 = happySpecReduce_3  9 happyReduction_62
    happyReduction_62 (HappyAbsSyn5  happy_var_3)
      _
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn9
        (Gt happy_var_1 happy_var_3
      )
    happyReduction_62 _ _ _  = notHappyAtAll 

    happyReduce_63 = happySpecReduce_3  9 happyReduction_63
    happyReduction_63 (HappyAbsSyn5  happy_var_3)
      _
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn9
        (Lt happy_var_1 happy_var_3
      )
    happyReduction_63 _ _ _  = notHappyAtAll 

    happyReduce_64 = happySpecReduce_3  9 happyReduction_64
    happyReduction_64 (HappyAbsSyn5  happy_var_3)
      _
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn9
        (Eq happy_var_1 happy_var_3
      )
    happyReduction_64 _ _ _  = notHappyAtAll 

    happyReduce_65 = happySpecReduce_3  9 happyReduction_65
    happyReduction_65 (HappyAbsSyn5  happy_var_3)
      _
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn9
        (GEq happy_var_1 happy_var_3
      )
    happyReduction_65 _ _ _  = notHappyAtAll 

    happyReduce_66 = happySpecReduce_3  9 happyReduction_66
    happyReduction_66 (HappyAbsSyn5  happy_var_3)
      _
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn9
        (LEq happy_var_1 happy_var_3
      )
    happyReduction_66 _ _ _  = notHappyAtAll 

    happyReduce_67 = happySpecReduce_3  9 happyReduction_67
    happyReduction_67 (HappyAbsSyn5  happy_var_3)
      _
      (HappyAbsSyn5  happy_var_1)
      =  HappyAbsSyn9
        (Diff happy_var_1 happy_var_3
      )
    happyReduction_67 _ _ _  = notHappyAtAll 

    happyReduce_68 = happySpecReduce_3  9 happyReduction_68
    happyReduction_68 (HappyAbsSyn9  happy_var_3)
      _
      (HappyAbsSyn9  happy_var_1)
      =  HappyAbsSyn9
        (And happy_var_1 happy_var_3
      )
    happyReduction_68 _ _ _  = notHappyAtAll 

    happyReduce_69 = happySpecReduce_3  9 happyReduction_69
    happyReduction_69 (HappyAbsSyn9  happy_var_3)
      _
      (HappyAbsSyn9  happy_var_1)
      =  HappyAbsSyn9
        (Or happy_var_1 happy_var_3
      )
    happyReduction_69 _ _ _  = notHappyAtAll 

    happyReduce_70 = happySpecReduce_2  9 happyReduction_70
    happyReduction_70 (HappyAbsSyn9  happy_var_2)
      _
      =  HappyAbsSyn9
        (Not happy_var_2
      )
    happyReduction_70 _ _  = notHappyAtAll 

    happyReduce_71 = happySpecReduce_3  9 happyReduction_71
    happyReduction_71 _
      (HappyAbsSyn9  happy_var_2)
      _
      =  HappyAbsSyn9
        (happy_var_2
      )
    happyReduction_71 _ _ _  = notHappyAtAll 

    happyNewToken action sts stk [] =
      action 79 79 notHappyAtAll (HappyState action) sts stk []

    happyNewToken action sts stk (tk:tks) =
      let cont i = action i i tk (HappyState action) sts stk tks in
      case tk of {
      TokenFod -> cont 10;
      TokenFd -> cont 11;
      TokenBak -> cont 12;
      TokenBk -> cont 13;
      TokenRit -> cont 14;
      TokenRt -> cont 15;
      TokenLet -> cont 16;
      TokenLt -> cont 17;
      TokenCls -> cont 18;
      TokenCs -> cont 19;
      TokenCln -> cont 20;
      TokenPup -> cont 21;
      TokenPu -> cont 22;
      TokenPdn -> cont 23;
      TokenPd -> cont 24;
      TokenHte -> cont 25;
      TokenHt -> cont 26;
      TokenSte -> cont 27;
      TokenSt -> cont 28;
      TokenHome -> cont 29;
      TokenStx -> cont 30;
      TokenSty -> cont 31;
      TokenStxy -> cont 32;
      TokenSethead -> cont 33;
      TokenSeth -> cont 34;
      TokenRep -> cont 35;
      TokenPrnt -> cont 36;
      TokenTo -> cont 37;
      TokenEnd -> cont 38;
      TokenSetCol -> cont 39;
      TokenMk -> cont 40;
      TokenFor -> cont 41;
      TokenIf -> cont 42;
      TokenFill -> cont 43;
      TokenFilled -> cont 44;
      TokenWait -> cont 45;
      TokenWhile -> cont 46;
      TokenPos -> cont 47;
      TokenList -> cont 48;
      TokenXCor -> cont 49;
      TokenYCor -> cont 50;
      TokenHead -> cont 51;
      TokenTow -> cont 52;
      TokenRef -> cont 53;
      TokenSum -> cont 54;
      TokenDiff -> cont 55;
      TokenFst -> cont 56;
      TokenLst -> cont 57;
      TokenItem -> cont 58;
      TokenPick -> cont 59;
      TokenTail -> cont 60;
      TokenRTail -> cont 61;
      TokenRead -> cont 62;
      TokenVar happy_dollar_dollar -> cont 63;
      TokenNum happy_dollar_dollar -> cont 64;
      TokenStr -> cont 65;
      TokenPA -> cont 66;
      TokenPC -> cont 67;
      TokenCA -> cont 68;
      TokenCC -> cont 69;
      TokenMayor -> cont 70;
      TokenMenor -> cont 71;
      TokenIgual -> cont 72;
      TokenMaIgual -> cont 73;
      TokenMeIgual -> cont 74;
      TokenNoIgual -> cont 75;
      TokenY -> cont 76;
      TokenO -> cont 77;
      TokenNo -> cont 78;
      _ -> happyError' ((tk:tks), [])
      }

    happyError_ explist 79 tk tks = happyError' (tks, explist)
    happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

    newtype HappyIdentity a = HappyIdentity a
    happyIdentity = HappyIdentity
    happyRunIdentity (HappyIdentity a) = a

    instance Prelude.Functor HappyIdentity where
        fmap f (HappyIdentity a) = HappyIdentity (f a)

    instance Applicative HappyIdentity where
        pure  = HappyIdentity
        (<*>) = ap
    instance Prelude.Monad HappyIdentity where
        return = pure
        (HappyIdentity p) >>= q = q p

    happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
    happyThen = (Prelude.>>=)
    happyReturn :: () => a -> HappyIdentity a
    happyReturn = (Prelude.return)
    happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
    happyReturn1 :: () => a -> b -> HappyIdentity a
    happyReturn1 = \a tks -> (Prelude.return) a
    happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
    happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
    logo tks = happyRunIdentity happySomeParser where
    happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

    happySeq = happyDontSeq


    parseError :: [Token] -> a
      parseError _ = error "Parse error"

      data Token = TokenFod
                | TokenFd
                | TokenBak 
                | TokenBk 
                | TokenRit 
                | TokenRt 
                | TokenLet 
                | TokenLt 
                | TokenCls 
                | TokenCs 
                | TokenCln 
                | TokenPup 
                | TokenPu 
                | TokenPdn 
                | TokenPd 
                | TokenHte
                | TokenHt 
                | TokenSte 
                | TokenSt 
                | TokenHome 
                | TokenStx 
                | TokenSty 
                | TokenStxy 
                | TokenSethead 
                | TokenSeth
                | TokenRep 
                | TokenPrnt 
                | TokenTo 
                | TokenEnd 
                | TokenSetCo 
                | TokenMk  
                | TokenFor  
                | TokenIf
                | TokenFill  
                | TokenFilled
                | TokenWait 
                | TokenWhile
                | TokenPos 
                | TokenList
                | TokenXCor 
                | TokenYCor 
                | TokenHead 
                | TokenTow 
                | TokenRef 
                | TokenSum 
                | TokenDiff 
                | TokenFst 
                | TokenLst 
                | TokenItem 
                | TokenPick 
                | TokenTail 
                | TokenRTail
                | TokenRead 
                | TokenVar String
                | TokenNum Fractional
                | TokenStr 
                | TokenPA 
                | TokenPC 
                | TokenCA 
                | TokenCC 
                | TokenMayor 
                | TokenMenor 
                | TokenIgual 
                | TokenMaIgual
                | TokenMeIgual
                | TokenNoIgual
                | TokenY
                | TokenO
                | TokenNo

    lexer :: String -> [Token]
    lexer [] = []
    lexer (c:cs) 
          | isSpace c = lexer cs
          | isAlpha c = lexVar (c:cs)
          | isDigit c = lexNum (c:cs)
    lexer ('"':cs) = TokenStr : lexer cs
    lexer (':':cs) = TokenRef : lexer cs
    lexer ('>':'=':cs) = TokenMaIgual : lexer cs
    lexer ('<':'=':cs) = TokenMeIgual : lexer cs
    lexer ('!':'=':cs) = TokenNoIgual : lexer cs
    lexer ('>':cs) = TokenMayor : lexer cs
    lexer ('<':cs) = TokenMenor : lexer cs
    lexer ('=':cs) = TokenIgual : lexer cs
    lexer ('(':cs) = TokenPA : lexer cs
    lexer (')':cs) = TokenPC : lexer cs
    lexer ('[':cs) = TokenCA : lexer cs
    lexer (']':cs) = TokenCC : lexer cs

    lexNum cs = TokenNum (read num) : lexer rest
          where (num,rest) = span (\d -> isDigit d || d == '.') cs

    lexVar cs =
      case span isAlpha cs of
          ("fordward",rest) -> TokenFod : lexer rest
          ("fd",rest) -> TokenFd : lexer rest
          ("back",rest) -> TokenBak : lexer rest
          ("bk",rest) -> TokenBk : lexer rest
          ("right",rest) -> TokenRit : lexer rest
          ("rt",rest) -> TokenRt : lexer rest
          ("left",rest) -> TokenLet : lexer rest
          ("lt",rest) -> TokenLt : lexer rest
          ("clearscreen",rest) -> TokenCls : lexer rest
          ("cs",rest) -> TokenCs : lexer rest
          ("clean",rest) -> TokenCln : lexer rest
          ("penup",rest) -> TokenPup : lexer rest
          ("pu",rest) -> TokenPu : lexer rest
          ("pendown",rest) -> TokenPdn : lexer rest
          ("pd",rest) -> TokenPd : lexer rest
          ("hideturtle",rest) -> TokenHte : lexer rest
          ("ht",rest) -> TokenHt : lexer rest
          ("showturtle",rest) -> TokenSte : lexer rest
          ("st",rest) -> TokenSt : lexer rest
          ("home",rest) -> TokenHome : lexer rest
          ("setx",rest) -> TokenStx : lexer rest
          ("sety",rest) -> TokenSty : lexer rest
          ("setxy",rest) -> TokenStxy : lexer rest
          ("setheading",rest) -> TokenSethead : lexer rest
          ("seth",rest) -> TokenSeth : lexer rest
          ("repeat",rest) -> TokenRep : lexer rest
          ("print",rest) -> TokenPrnt : lexer rest
          ("to",rest) -> TokenTo : lexer rest
          ("end",rest) -> TokenEnd : lexer rest
          ("setcolor",rest) -> TokenSetCo : lexer rest
          ("make",rest) -> TokenMk : lexer rest
          ("for",rest) -> TokenFor : lexer rest
          ("if",rest) -> TokenIf : lexer rest
          ("fill",rest) -> TokenFill : lexer rest
          ("filled",rest) -> TokenFilled : lexer rest
          ("wait",rest) -> TokenWait : lexer rest
          ("do.while",rest) -> TokenWhile : lexer rest
          ("pos",rest) -> TokenPos : lexer rest
          ("list",rest) -> TokenList : lexer rest
          ("xcor",rest) -> TokenXCor : lexer rest
          ("ycor",rest) -> TokenYCor : lexer rest
          ("heading",rest) -> TokenHead : lexer rest
          ("towards",rest) -> TokenTow : lexer rest
          ("sum",rest) -> TokenSum : lexer rest
          ("difference",rest) -> TokenDiff : lexer rest
          ("first",rest) -> TokenFst : lexer rest
          ("last",rest) -> TokenLst : lexer rest
          ("item",rest) -> TokenItem : lexer rest
          ("pick",rest) -> TokenPick : lexer rest
          ("butfirst",rest) -> TokenTail : lexer rest
          ("butlast",rest) -> TokenRTail : lexer rest
          ("readword",rest) -> TokenRead : lexer rest
          ("not",rest) -> TokenNot : lexer rest
          (var,rest)   -> TokenVar var : lexer rest
    {-# LINE 1 "templates/GenericTemplate.hs" #-}
    -- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































    data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































    infixr 9 `HappyStk`
    data HappyStk a = HappyStk a (HappyStk a)

    -----------------------------------------------------------------------------
    -- starting the parse

    happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

    -----------------------------------------------------------------------------
    -- Accepting the parse

    -- If the current token is ERROR_TOK, it means we've just accepted a partial
    -- parse (a %partial parser).  We must ignore the saved token on the top of
    -- the stack in this case.
    happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
            happyReturn1 ans
    happyAccept j tk st sts (HappyStk ans _) = 
            (happyReturn1 ans)

    -----------------------------------------------------------------------------
    -- Arrays only: do the next action









































    indexShortOffAddr arr off = arr Happy_Data_Array.! off


    {-# INLINE happyLt #-}
    happyLt x y = (x Prelude.< y)






    readArrayBit arr bit =
        Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






    -----------------------------------------------------------------------------
    -- HappyState data type (not arrays)



    newtype HappyState b c = HappyState
            (Prelude.Int ->                    -- token number
            Prelude.Int ->                    -- token number (yes, again)
            b ->                           -- token semantic value
            HappyState b c ->              -- current state
            [HappyState b c] ->            -- state stack
            c)



    -----------------------------------------------------------------------------
    -- Shifting a token

    happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
        let i = (case x of { HappyErrorToken (i) -> i }) in
    --     trace "shifting the error token" $
        new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

    happyShift new_state i tk st sts stk =
        happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

    -- happyReduce is specialised for the common cases.

    happySpecReduce_0 i fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
        = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

    happySpecReduce_1 i fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
        = let r = fn v1 in
          happySeq r (action nt j tk st sts (r `HappyStk` stk'))

    happySpecReduce_2 i fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
        = let r = fn v1 v2 in
          happySeq r (action nt j tk st sts (r `HappyStk` stk'))

    happySpecReduce_3 i fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
        = let r = fn v1 v2 v3 in
          happySeq r (action nt j tk st sts (r `HappyStk` stk'))

    happyReduce k i fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happyReduce k nt fn j tk st sts stk
        = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
            sts1@(((st1@(HappyState (action))):(_))) ->
                    let r = fn stk in  -- it doesn't hurt to always seq here...
                    happyDoSeq r (action nt j tk st1 sts1 r)

    happyMonadReduce k nt fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happyMonadReduce k nt fn j tk st sts stk =
          case happyDrop k ((st):(sts)) of
            sts1@(((st1@(HappyState (action))):(_))) ->
              let drop_stk = happyDropStk k stk in
              happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

    happyMonad2Reduce k nt fn (1) tk st sts stk
        = happyFail [] (1) tk st sts stk
    happyMonad2Reduce k nt fn j tk st sts stk =
          case happyDrop k ((st):(sts)) of
            sts1@(((st1@(HappyState (action))):(_))) ->
            let drop_stk = happyDropStk k stk





                _ = nt :: Prelude.Int
                new_state = action

              in
              happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

    happyDrop (0) l = l
    happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

    happyDropStk (0) l = l
    happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

    -----------------------------------------------------------------------------
    -- Moving to a new state after a reduction









    happyGoto action j tk st = action j j tk (HappyState action)


    -----------------------------------------------------------------------------
    -- Error recovery (ERROR_TOK is the error token)

    -- parse error if we are in recovery and we fail again
    happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
        let i = (case x of { HappyErrorToken (i) -> i }) in
    --      trace "failing" $ 
            happyError_ explist i tk

    {-  We don't need state discarding for our restricted implementation of
        "error".  In fact, it can cause some bogus parses, so I've disabled it
        for now --SDM

    -- discard a state
    happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                    (saved_tok `HappyStk` _ `HappyStk` stk) =
    --      trace ("discarding state, depth " ++ show (length stk))  $
            DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
    -}

    -- Enter error recovery: generate an error token,
    --                       save the old token and carry on.
    happyFail explist i tk (HappyState (action)) sts stk =
    --      trace "entering error recovery" $
            action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

    -- Internal happy errors:

    notHappyAtAll :: a
    notHappyAtAll = Prelude.error "Internal Happy error\n"

    -----------------------------------------------------------------------------
    -- Hack to get the typechecker to accept our action functions







    -----------------------------------------------------------------------------
    -- Seq-ing.  If the --strict flag is given, then Happy emits 
    --      happySeq = happyDoSeq
    -- otherwise it emits
    --      happySeq = happyDontSeq

    happyDoSeq, happyDontSeq :: a -> b -> b
    happyDoSeq   a b = a `Prelude.seq` b
    happyDontSeq a b = b

    -----------------------------------------------------------------------------
    -- Don't inline any functions from the template.  GHC has a nasty habit
    -- of deciding to inline happyGoto everywhere, which increases the size of
    -- the generated parser quite a bit.









    {-# NOINLINE happyShift #-}
    {-# NOINLINE happySpecReduce_0 #-}
    {-# NOINLINE happySpecReduce_1 #-}
    {-# NOINLINE happySpecReduce_2 #-}
    {-# NOINLINE happySpecReduce_3 #-}
    {-# NOINLINE happyReduce #-}
    {-# NOINLINE happyMonadReduce #-}
    {-# NOINLINE happyGoto #-}
    {-# NOINLINE happyFail #-}

    -- end of Happy Template.
