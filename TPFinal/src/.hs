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
	| HappyAbsSyn4 ([Comm])
	| HappyAbsSyn5 (Comm)
	| HappyAbsSyn6 (Exp)
	| HappyAbsSyn7 (List)
	| HappyAbsSyn8 ([Exp])
	| HappyAbsSyn9 ([String])
	| HappyAbsSyn10 (Boolen)

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
 action_153 :: () => Prelude.Int -> ({-HappyReduction (HappyIdentity) = -}
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
 happyReduce_70 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,270) ([64512,65535,32703,0,0,64512,65535,32703,0,0,0,0,0,0,0,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32768,0,0,0,0,32574,5,0,0,0,0,2,0,0,0,0,16,0,0,0,32574,16389,0,0,0,0,0,0,0,0,32574,5,0,0,0,32574,5,0,0,0,0,16,0,0,0,0,0,64512,65535,32703,0,0,0,0,0,0,0,64512,65535,32703,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,1,4,0,0,0,32768,0,0,0,32768,1,4,0,0,32768,1,4,0,0,0,32574,5,0,0,32768,1,4,0,0,32768,1,4,0,0,32768,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,32574,5,0,0,0,0,16,0,0,0,0,4032,0,0,0,0,12304,0,0,0,32574,16389,0,0,0,32574,16389,0,0,0,32768,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,32574,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64512,65535,32703,0,0,64512,65535,32703,0,0,0,0,0,32768,0,0,0,0,32574,5,0,0,0,32574,5,0,0,0,0,0,0,0,0,0,4040,0,0,0,0,12296,64512,65535,32703,0,0,0,0,0,32574,16389,0,0,0,32574,16389,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,0,0,0,32574,5,64512,65535,32703,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,32574,5,0,0,32768,1,4,0,0,0,0,0,0,0,0,0,0,0,0,32768,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,32574,16389,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,32574,5,0,0,0,0,0,0,0,0,32,0,0,0,64,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32574,37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12288,0,0,0,0,32,0,0,0,0,16,64512,65535,32703,0,0,0,0,0,0,16,64512,65535,32703,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_logo","CommSeq","Comm","Exp","List","SecExp","Args","Bool","fordward","fd","back","bk","right","rt","left","lt","clearscreen","cs","clean","penup","pu","pendown","pd","hideturtle","ht","showturtle","st","home","setx","sety","setxy","setheading","seth","repeat","print","to","end","setcolor","make","for","if","fill","filled","wait","'do.while'","pos","list","xcor","ycor","heading","towards","':'","sum","difference","first","last","item","pick","butfirst","butlast","readword","var","num","'\"'","'('","')'","'['","']'","'>'","'<'","'='","'<='","'>='","'!='","'&&'","'||'","not","%eof"]
        bit_start = st Prelude.* 80
        bit_end = (st Prelude.+ 1) Prelude.* 80
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..79]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (11) = happyShift action_3
action_0 (12) = happyShift action_4
action_0 (13) = happyShift action_5
action_0 (14) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (19) = happyShift action_11
action_0 (20) = happyShift action_12
action_0 (21) = happyShift action_13
action_0 (22) = happyShift action_14
action_0 (23) = happyShift action_15
action_0 (24) = happyShift action_16
action_0 (25) = happyShift action_17
action_0 (26) = happyShift action_18
action_0 (27) = happyShift action_19
action_0 (28) = happyShift action_20
action_0 (29) = happyShift action_21
action_0 (30) = happyShift action_22
action_0 (31) = happyShift action_23
action_0 (32) = happyShift action_24
action_0 (33) = happyShift action_25
action_0 (34) = happyShift action_26
action_0 (35) = happyShift action_27
action_0 (36) = happyShift action_28
action_0 (37) = happyShift action_29
action_0 (38) = happyShift action_30
action_0 (40) = happyShift action_31
action_0 (41) = happyShift action_32
action_0 (42) = happyShift action_33
action_0 (43) = happyShift action_34
action_0 (44) = happyShift action_35
action_0 (45) = happyShift action_36
action_0 (46) = happyShift action_37
action_0 (47) = happyShift action_38
action_0 (4) = happyGoto action_39
action_0 (5) = happyGoto action_40
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_3
action_1 (12) = happyShift action_4
action_1 (13) = happyShift action_5
action_1 (14) = happyShift action_6
action_1 (15) = happyShift action_7
action_1 (16) = happyShift action_8
action_1 (17) = happyShift action_9
action_1 (18) = happyShift action_10
action_1 (19) = happyShift action_11
action_1 (20) = happyShift action_12
action_1 (21) = happyShift action_13
action_1 (22) = happyShift action_14
action_1 (23) = happyShift action_15
action_1 (24) = happyShift action_16
action_1 (25) = happyShift action_17
action_1 (26) = happyShift action_18
action_1 (27) = happyShift action_19
action_1 (28) = happyShift action_20
action_1 (29) = happyShift action_21
action_1 (30) = happyShift action_22
action_1 (31) = happyShift action_23
action_1 (32) = happyShift action_24
action_1 (33) = happyShift action_25
action_1 (34) = happyShift action_26
action_1 (35) = happyShift action_27
action_1 (36) = happyShift action_28
action_1 (37) = happyShift action_29
action_1 (38) = happyShift action_30
action_1 (40) = happyShift action_31
action_1 (41) = happyShift action_32
action_1 (42) = happyShift action_33
action_1 (43) = happyShift action_34
action_1 (44) = happyShift action_35
action_1 (45) = happyShift action_36
action_1 (46) = happyShift action_37
action_1 (47) = happyShift action_38
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (50) = happyShift action_44
action_3 (51) = happyShift action_45
action_3 (52) = happyShift action_46
action_3 (53) = happyShift action_47
action_3 (54) = happyShift action_48
action_3 (57) = happyShift action_49
action_3 (58) = happyShift action_50
action_3 (59) = happyShift action_51
action_3 (60) = happyShift action_52
action_3 (61) = happyShift action_53
action_3 (62) = happyShift action_54
action_3 (63) = happyShift action_55
action_3 (65) = happyShift action_56
action_3 (67) = happyShift action_57
action_3 (6) = happyGoto action_81
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (50) = happyShift action_44
action_4 (51) = happyShift action_45
action_4 (52) = happyShift action_46
action_4 (53) = happyShift action_47
action_4 (54) = happyShift action_48
action_4 (57) = happyShift action_49
action_4 (58) = happyShift action_50
action_4 (59) = happyShift action_51
action_4 (60) = happyShift action_52
action_4 (61) = happyShift action_53
action_4 (62) = happyShift action_54
action_4 (63) = happyShift action_55
action_4 (65) = happyShift action_56
action_4 (67) = happyShift action_57
action_4 (6) = happyGoto action_80
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (50) = happyShift action_44
action_5 (51) = happyShift action_45
action_5 (52) = happyShift action_46
action_5 (53) = happyShift action_47
action_5 (54) = happyShift action_48
action_5 (57) = happyShift action_49
action_5 (58) = happyShift action_50
action_5 (59) = happyShift action_51
action_5 (60) = happyShift action_52
action_5 (61) = happyShift action_53
action_5 (62) = happyShift action_54
action_5 (63) = happyShift action_55
action_5 (65) = happyShift action_56
action_5 (67) = happyShift action_57
action_5 (6) = happyGoto action_79
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (50) = happyShift action_44
action_6 (51) = happyShift action_45
action_6 (52) = happyShift action_46
action_6 (53) = happyShift action_47
action_6 (54) = happyShift action_48
action_6 (57) = happyShift action_49
action_6 (58) = happyShift action_50
action_6 (59) = happyShift action_51
action_6 (60) = happyShift action_52
action_6 (61) = happyShift action_53
action_6 (62) = happyShift action_54
action_6 (63) = happyShift action_55
action_6 (65) = happyShift action_56
action_6 (67) = happyShift action_57
action_6 (6) = happyGoto action_78
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (50) = happyShift action_44
action_7 (51) = happyShift action_45
action_7 (52) = happyShift action_46
action_7 (53) = happyShift action_47
action_7 (54) = happyShift action_48
action_7 (57) = happyShift action_49
action_7 (58) = happyShift action_50
action_7 (59) = happyShift action_51
action_7 (60) = happyShift action_52
action_7 (61) = happyShift action_53
action_7 (62) = happyShift action_54
action_7 (63) = happyShift action_55
action_7 (65) = happyShift action_56
action_7 (67) = happyShift action_57
action_7 (6) = happyGoto action_77
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (50) = happyShift action_44
action_8 (51) = happyShift action_45
action_8 (52) = happyShift action_46
action_8 (53) = happyShift action_47
action_8 (54) = happyShift action_48
action_8 (57) = happyShift action_49
action_8 (58) = happyShift action_50
action_8 (59) = happyShift action_51
action_8 (60) = happyShift action_52
action_8 (61) = happyShift action_53
action_8 (62) = happyShift action_54
action_8 (63) = happyShift action_55
action_8 (65) = happyShift action_56
action_8 (67) = happyShift action_57
action_8 (6) = happyGoto action_76
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (50) = happyShift action_44
action_9 (51) = happyShift action_45
action_9 (52) = happyShift action_46
action_9 (53) = happyShift action_47
action_9 (54) = happyShift action_48
action_9 (57) = happyShift action_49
action_9 (58) = happyShift action_50
action_9 (59) = happyShift action_51
action_9 (60) = happyShift action_52
action_9 (61) = happyShift action_53
action_9 (62) = happyShift action_54
action_9 (63) = happyShift action_55
action_9 (65) = happyShift action_56
action_9 (67) = happyShift action_57
action_9 (6) = happyGoto action_75
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (50) = happyShift action_44
action_10 (51) = happyShift action_45
action_10 (52) = happyShift action_46
action_10 (53) = happyShift action_47
action_10 (54) = happyShift action_48
action_10 (57) = happyShift action_49
action_10 (58) = happyShift action_50
action_10 (59) = happyShift action_51
action_10 (60) = happyShift action_52
action_10 (61) = happyShift action_53
action_10 (62) = happyShift action_54
action_10 (63) = happyShift action_55
action_10 (65) = happyShift action_56
action_10 (67) = happyShift action_57
action_10 (6) = happyGoto action_74
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_11

action_12 _ = happyReduce_12

action_13 _ = happyReduce_13

action_14 _ = happyReduce_14

action_15 _ = happyReduce_15

action_16 _ = happyReduce_16

action_17 _ = happyReduce_17

action_18 _ = happyReduce_18

action_19 _ = happyReduce_19

action_20 _ = happyReduce_20

action_21 _ = happyReduce_21

action_22 _ = happyReduce_22

action_23 (50) = happyShift action_44
action_23 (51) = happyShift action_45
action_23 (52) = happyShift action_46
action_23 (53) = happyShift action_47
action_23 (54) = happyShift action_48
action_23 (57) = happyShift action_49
action_23 (58) = happyShift action_50
action_23 (59) = happyShift action_51
action_23 (60) = happyShift action_52
action_23 (61) = happyShift action_53
action_23 (62) = happyShift action_54
action_23 (63) = happyShift action_55
action_23 (65) = happyShift action_56
action_23 (67) = happyShift action_57
action_23 (6) = happyGoto action_73
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (50) = happyShift action_44
action_24 (51) = happyShift action_45
action_24 (52) = happyShift action_46
action_24 (53) = happyShift action_47
action_24 (54) = happyShift action_48
action_24 (57) = happyShift action_49
action_24 (58) = happyShift action_50
action_24 (59) = happyShift action_51
action_24 (60) = happyShift action_52
action_24 (61) = happyShift action_53
action_24 (62) = happyShift action_54
action_24 (63) = happyShift action_55
action_24 (65) = happyShift action_56
action_24 (67) = happyShift action_57
action_24 (6) = happyGoto action_72
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (50) = happyShift action_44
action_25 (51) = happyShift action_45
action_25 (52) = happyShift action_46
action_25 (53) = happyShift action_47
action_25 (54) = happyShift action_48
action_25 (57) = happyShift action_49
action_25 (58) = happyShift action_50
action_25 (59) = happyShift action_51
action_25 (60) = happyShift action_52
action_25 (61) = happyShift action_53
action_25 (62) = happyShift action_54
action_25 (63) = happyShift action_55
action_25 (65) = happyShift action_56
action_25 (67) = happyShift action_57
action_25 (6) = happyGoto action_71
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (50) = happyShift action_44
action_26 (51) = happyShift action_45
action_26 (52) = happyShift action_46
action_26 (53) = happyShift action_47
action_26 (54) = happyShift action_48
action_26 (57) = happyShift action_49
action_26 (58) = happyShift action_50
action_26 (59) = happyShift action_51
action_26 (60) = happyShift action_52
action_26 (61) = happyShift action_53
action_26 (62) = happyShift action_54
action_26 (63) = happyShift action_55
action_26 (65) = happyShift action_56
action_26 (67) = happyShift action_57
action_26 (6) = happyGoto action_70
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (50) = happyShift action_44
action_27 (51) = happyShift action_45
action_27 (52) = happyShift action_46
action_27 (53) = happyShift action_47
action_27 (54) = happyShift action_48
action_27 (57) = happyShift action_49
action_27 (58) = happyShift action_50
action_27 (59) = happyShift action_51
action_27 (60) = happyShift action_52
action_27 (61) = happyShift action_53
action_27 (62) = happyShift action_54
action_27 (63) = happyShift action_55
action_27 (65) = happyShift action_56
action_27 (67) = happyShift action_57
action_27 (6) = happyGoto action_69
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (50) = happyShift action_44
action_28 (51) = happyShift action_45
action_28 (52) = happyShift action_46
action_28 (53) = happyShift action_47
action_28 (54) = happyShift action_48
action_28 (57) = happyShift action_49
action_28 (58) = happyShift action_50
action_28 (59) = happyShift action_51
action_28 (60) = happyShift action_52
action_28 (61) = happyShift action_53
action_28 (62) = happyShift action_54
action_28 (63) = happyShift action_55
action_28 (65) = happyShift action_56
action_28 (67) = happyShift action_57
action_28 (6) = happyGoto action_68
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (50) = happyShift action_44
action_29 (51) = happyShift action_45
action_29 (52) = happyShift action_46
action_29 (53) = happyShift action_47
action_29 (54) = happyShift action_48
action_29 (57) = happyShift action_49
action_29 (58) = happyShift action_50
action_29 (59) = happyShift action_51
action_29 (60) = happyShift action_52
action_29 (61) = happyShift action_53
action_29 (62) = happyShift action_54
action_29 (63) = happyShift action_55
action_29 (65) = happyShift action_56
action_29 (67) = happyShift action_57
action_29 (6) = happyGoto action_67
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (64) = happyShift action_66
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (50) = happyShift action_44
action_31 (51) = happyShift action_45
action_31 (52) = happyShift action_46
action_31 (53) = happyShift action_47
action_31 (54) = happyShift action_48
action_31 (57) = happyShift action_49
action_31 (58) = happyShift action_50
action_31 (59) = happyShift action_51
action_31 (60) = happyShift action_52
action_31 (61) = happyShift action_53
action_31 (62) = happyShift action_54
action_31 (63) = happyShift action_55
action_31 (65) = happyShift action_56
action_31 (67) = happyShift action_57
action_31 (6) = happyGoto action_65
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (66) = happyShift action_64
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (69) = happyShift action_63
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (50) = happyShift action_44
action_34 (51) = happyShift action_45
action_34 (52) = happyShift action_46
action_34 (53) = happyShift action_47
action_34 (54) = happyShift action_48
action_34 (57) = happyShift action_49
action_34 (58) = happyShift action_50
action_34 (59) = happyShift action_51
action_34 (60) = happyShift action_52
action_34 (61) = happyShift action_53
action_34 (62) = happyShift action_54
action_34 (63) = happyShift action_55
action_34 (65) = happyShift action_56
action_34 (67) = happyShift action_61
action_34 (79) = happyShift action_62
action_34 (6) = happyGoto action_59
action_34 (10) = happyGoto action_60
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_36

action_36 (50) = happyShift action_44
action_36 (51) = happyShift action_45
action_36 (52) = happyShift action_46
action_36 (53) = happyShift action_47
action_36 (54) = happyShift action_48
action_36 (57) = happyShift action_49
action_36 (58) = happyShift action_50
action_36 (59) = happyShift action_51
action_36 (60) = happyShift action_52
action_36 (61) = happyShift action_53
action_36 (62) = happyShift action_54
action_36 (63) = happyShift action_55
action_36 (65) = happyShift action_56
action_36 (67) = happyShift action_57
action_36 (6) = happyGoto action_58
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (50) = happyShift action_44
action_37 (51) = happyShift action_45
action_37 (52) = happyShift action_46
action_37 (53) = happyShift action_47
action_37 (54) = happyShift action_48
action_37 (57) = happyShift action_49
action_37 (58) = happyShift action_50
action_37 (59) = happyShift action_51
action_37 (60) = happyShift action_52
action_37 (61) = happyShift action_53
action_37 (62) = happyShift action_54
action_37 (63) = happyShift action_55
action_37 (65) = happyShift action_56
action_37 (67) = happyShift action_57
action_37 (6) = happyGoto action_43
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (69) = happyShift action_42
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (80) = happyAccept
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (11) = happyShift action_3
action_40 (12) = happyShift action_4
action_40 (13) = happyShift action_5
action_40 (14) = happyShift action_6
action_40 (15) = happyShift action_7
action_40 (16) = happyShift action_8
action_40 (17) = happyShift action_9
action_40 (18) = happyShift action_10
action_40 (19) = happyShift action_11
action_40 (20) = happyShift action_12
action_40 (21) = happyShift action_13
action_40 (22) = happyShift action_14
action_40 (23) = happyShift action_15
action_40 (24) = happyShift action_16
action_40 (25) = happyShift action_17
action_40 (26) = happyShift action_18
action_40 (27) = happyShift action_19
action_40 (28) = happyShift action_20
action_40 (29) = happyShift action_21
action_40 (30) = happyShift action_22
action_40 (31) = happyShift action_23
action_40 (32) = happyShift action_24
action_40 (33) = happyShift action_25
action_40 (34) = happyShift action_26
action_40 (35) = happyShift action_27
action_40 (36) = happyShift action_28
action_40 (37) = happyShift action_29
action_40 (38) = happyShift action_30
action_40 (40) = happyShift action_31
action_40 (41) = happyShift action_32
action_40 (42) = happyShift action_33
action_40 (43) = happyShift action_34
action_40 (44) = happyShift action_35
action_40 (45) = happyShift action_36
action_40 (46) = happyShift action_37
action_40 (47) = happyShift action_38
action_40 (4) = happyGoto action_41
action_40 (5) = happyGoto action_40
action_40 _ = happyReduce_1

action_41 _ = happyReduce_2

action_42 (11) = happyShift action_3
action_42 (12) = happyShift action_4
action_42 (13) = happyShift action_5
action_42 (14) = happyShift action_6
action_42 (15) = happyShift action_7
action_42 (16) = happyShift action_8
action_42 (17) = happyShift action_9
action_42 (18) = happyShift action_10
action_42 (19) = happyShift action_11
action_42 (20) = happyShift action_12
action_42 (21) = happyShift action_13
action_42 (22) = happyShift action_14
action_42 (23) = happyShift action_15
action_42 (24) = happyShift action_16
action_42 (25) = happyShift action_17
action_42 (26) = happyShift action_18
action_42 (27) = happyShift action_19
action_42 (28) = happyShift action_20
action_42 (29) = happyShift action_21
action_42 (30) = happyShift action_22
action_42 (31) = happyShift action_23
action_42 (32) = happyShift action_24
action_42 (33) = happyShift action_25
action_42 (34) = happyShift action_26
action_42 (35) = happyShift action_27
action_42 (36) = happyShift action_28
action_42 (37) = happyShift action_29
action_42 (38) = happyShift action_30
action_42 (40) = happyShift action_31
action_42 (41) = happyShift action_32
action_42 (42) = happyShift action_33
action_42 (43) = happyShift action_34
action_42 (44) = happyShift action_35
action_42 (45) = happyShift action_36
action_42 (46) = happyShift action_37
action_42 (47) = happyShift action_38
action_42 (5) = happyGoto action_113
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_38

action_44 _ = happyReduce_41

action_45 _ = happyReduce_42

action_46 _ = happyReduce_43

action_47 (48) = happyShift action_103
action_47 (49) = happyShift action_104
action_47 (67) = happyShift action_105
action_47 (7) = happyGoto action_112
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (64) = happyShift action_111
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (48) = happyShift action_103
action_49 (49) = happyShift action_104
action_49 (67) = happyShift action_105
action_49 (7) = happyGoto action_110
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (48) = happyShift action_103
action_50 (49) = happyShift action_104
action_50 (67) = happyShift action_105
action_50 (7) = happyGoto action_109
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (50) = happyShift action_44
action_51 (51) = happyShift action_45
action_51 (52) = happyShift action_46
action_51 (53) = happyShift action_47
action_51 (54) = happyShift action_48
action_51 (57) = happyShift action_49
action_51 (58) = happyShift action_50
action_51 (59) = happyShift action_51
action_51 (60) = happyShift action_52
action_51 (61) = happyShift action_53
action_51 (62) = happyShift action_54
action_51 (63) = happyShift action_55
action_51 (65) = happyShift action_56
action_51 (67) = happyShift action_57
action_51 (6) = happyGoto action_108
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (48) = happyShift action_103
action_52 (49) = happyShift action_104
action_52 (67) = happyShift action_105
action_52 (7) = happyGoto action_107
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (48) = happyShift action_103
action_53 (49) = happyShift action_104
action_53 (67) = happyShift action_105
action_53 (7) = happyGoto action_106
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (48) = happyShift action_103
action_54 (49) = happyShift action_104
action_54 (67) = happyShift action_105
action_54 (7) = happyGoto action_102
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_52

action_56 _ = happyReduce_40

action_57 (50) = happyShift action_44
action_57 (51) = happyShift action_45
action_57 (52) = happyShift action_46
action_57 (53) = happyShift action_47
action_57 (54) = happyShift action_48
action_57 (57) = happyShift action_49
action_57 (58) = happyShift action_50
action_57 (59) = happyShift action_51
action_57 (60) = happyShift action_52
action_57 (61) = happyShift action_53
action_57 (62) = happyShift action_54
action_57 (63) = happyShift action_55
action_57 (65) = happyShift action_56
action_57 (67) = happyShift action_57
action_57 (6) = happyGoto action_101
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (69) = happyShift action_100
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (71) = happyShift action_94
action_59 (72) = happyShift action_95
action_59 (73) = happyShift action_96
action_59 (74) = happyShift action_97
action_59 (75) = happyShift action_98
action_59 (76) = happyShift action_99
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (69) = happyShift action_91
action_60 (77) = happyShift action_92
action_60 (78) = happyShift action_93
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (50) = happyShift action_44
action_61 (51) = happyShift action_45
action_61 (52) = happyShift action_46
action_61 (53) = happyShift action_47
action_61 (54) = happyShift action_48
action_61 (57) = happyShift action_49
action_61 (58) = happyShift action_50
action_61 (59) = happyShift action_51
action_61 (60) = happyShift action_52
action_61 (61) = happyShift action_53
action_61 (62) = happyShift action_54
action_61 (63) = happyShift action_55
action_61 (65) = happyShift action_56
action_61 (67) = happyShift action_61
action_61 (79) = happyShift action_62
action_61 (6) = happyGoto action_89
action_61 (10) = happyGoto action_90
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (50) = happyShift action_44
action_62 (51) = happyShift action_45
action_62 (52) = happyShift action_46
action_62 (53) = happyShift action_47
action_62 (54) = happyShift action_48
action_62 (57) = happyShift action_49
action_62 (58) = happyShift action_50
action_62 (59) = happyShift action_51
action_62 (60) = happyShift action_52
action_62 (61) = happyShift action_53
action_62 (62) = happyShift action_54
action_62 (63) = happyShift action_55
action_62 (65) = happyShift action_56
action_62 (67) = happyShift action_61
action_62 (79) = happyShift action_62
action_62 (6) = happyGoto action_59
action_62 (10) = happyGoto action_88
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (64) = happyShift action_87
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (64) = happyShift action_86
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_31

action_66 (54) = happyShift action_85
action_66 (9) = happyGoto action_84
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_29

action_68 (69) = happyShift action_83
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_27

action_70 _ = happyReduce_26

action_71 (50) = happyShift action_44
action_71 (51) = happyShift action_45
action_71 (52) = happyShift action_46
action_71 (53) = happyShift action_47
action_71 (54) = happyShift action_48
action_71 (57) = happyShift action_49
action_71 (58) = happyShift action_50
action_71 (59) = happyShift action_51
action_71 (60) = happyShift action_52
action_71 (61) = happyShift action_53
action_71 (62) = happyShift action_54
action_71 (63) = happyShift action_55
action_71 (65) = happyShift action_56
action_71 (67) = happyShift action_57
action_71 (6) = happyGoto action_82
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_24

action_73 _ = happyReduce_23

action_74 _ = happyReduce_10

action_75 _ = happyReduce_9

action_76 _ = happyReduce_8

action_77 _ = happyReduce_7

action_78 _ = happyReduce_6

action_79 _ = happyReduce_5

action_80 _ = happyReduce_4

action_81 _ = happyReduce_3

action_82 _ = happyReduce_25

action_83 (11) = happyShift action_3
action_83 (12) = happyShift action_4
action_83 (13) = happyShift action_5
action_83 (14) = happyShift action_6
action_83 (15) = happyShift action_7
action_83 (16) = happyShift action_8
action_83 (17) = happyShift action_9
action_83 (18) = happyShift action_10
action_83 (19) = happyShift action_11
action_83 (20) = happyShift action_12
action_83 (21) = happyShift action_13
action_83 (22) = happyShift action_14
action_83 (23) = happyShift action_15
action_83 (24) = happyShift action_16
action_83 (25) = happyShift action_17
action_83 (26) = happyShift action_18
action_83 (27) = happyShift action_19
action_83 (28) = happyShift action_20
action_83 (29) = happyShift action_21
action_83 (30) = happyShift action_22
action_83 (31) = happyShift action_23
action_83 (32) = happyShift action_24
action_83 (33) = happyShift action_25
action_83 (34) = happyShift action_26
action_83 (35) = happyShift action_27
action_83 (36) = happyShift action_28
action_83 (37) = happyShift action_29
action_83 (38) = happyShift action_30
action_83 (40) = happyShift action_31
action_83 (41) = happyShift action_32
action_83 (42) = happyShift action_33
action_83 (43) = happyShift action_34
action_83 (44) = happyShift action_35
action_83 (45) = happyShift action_36
action_83 (46) = happyShift action_37
action_83 (47) = happyShift action_38
action_83 (5) = happyGoto action_135
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (11) = happyShift action_3
action_84 (12) = happyShift action_4
action_84 (13) = happyShift action_5
action_84 (14) = happyShift action_6
action_84 (15) = happyShift action_7
action_84 (16) = happyShift action_8
action_84 (17) = happyShift action_9
action_84 (18) = happyShift action_10
action_84 (19) = happyShift action_11
action_84 (20) = happyShift action_12
action_84 (21) = happyShift action_13
action_84 (22) = happyShift action_14
action_84 (23) = happyShift action_15
action_84 (24) = happyShift action_16
action_84 (25) = happyShift action_17
action_84 (26) = happyShift action_18
action_84 (27) = happyShift action_19
action_84 (28) = happyShift action_20
action_84 (29) = happyShift action_21
action_84 (30) = happyShift action_22
action_84 (31) = happyShift action_23
action_84 (32) = happyShift action_24
action_84 (33) = happyShift action_25
action_84 (34) = happyShift action_26
action_84 (35) = happyShift action_27
action_84 (36) = happyShift action_28
action_84 (37) = happyShift action_29
action_84 (38) = happyShift action_30
action_84 (40) = happyShift action_31
action_84 (41) = happyShift action_32
action_84 (42) = happyShift action_33
action_84 (43) = happyShift action_34
action_84 (44) = happyShift action_35
action_84 (45) = happyShift action_36
action_84 (46) = happyShift action_37
action_84 (47) = happyShift action_38
action_84 (5) = happyGoto action_134
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (64) = happyShift action_133
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (50) = happyShift action_44
action_86 (51) = happyShift action_45
action_86 (52) = happyShift action_46
action_86 (53) = happyShift action_47
action_86 (54) = happyShift action_48
action_86 (57) = happyShift action_49
action_86 (58) = happyShift action_50
action_86 (59) = happyShift action_51
action_86 (60) = happyShift action_52
action_86 (61) = happyShift action_53
action_86 (62) = happyShift action_54
action_86 (63) = happyShift action_55
action_86 (65) = happyShift action_56
action_86 (67) = happyShift action_57
action_86 (6) = happyGoto action_132
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (50) = happyShift action_44
action_87 (51) = happyShift action_45
action_87 (52) = happyShift action_46
action_87 (53) = happyShift action_47
action_87 (54) = happyShift action_48
action_87 (57) = happyShift action_49
action_87 (58) = happyShift action_50
action_87 (59) = happyShift action_51
action_87 (60) = happyShift action_52
action_87 (61) = happyShift action_53
action_87 (62) = happyShift action_54
action_87 (63) = happyShift action_55
action_87 (65) = happyShift action_56
action_87 (67) = happyShift action_57
action_87 (6) = happyGoto action_131
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_69

action_89 (68) = happyShift action_119
action_89 (71) = happyShift action_94
action_89 (72) = happyShift action_95
action_89 (73) = happyShift action_96
action_89 (74) = happyShift action_97
action_89 (75) = happyShift action_98
action_89 (76) = happyShift action_99
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (68) = happyShift action_130
action_90 (77) = happyShift action_92
action_90 (78) = happyShift action_93
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (11) = happyShift action_3
action_91 (12) = happyShift action_4
action_91 (13) = happyShift action_5
action_91 (14) = happyShift action_6
action_91 (15) = happyShift action_7
action_91 (16) = happyShift action_8
action_91 (17) = happyShift action_9
action_91 (18) = happyShift action_10
action_91 (19) = happyShift action_11
action_91 (20) = happyShift action_12
action_91 (21) = happyShift action_13
action_91 (22) = happyShift action_14
action_91 (23) = happyShift action_15
action_91 (24) = happyShift action_16
action_91 (25) = happyShift action_17
action_91 (26) = happyShift action_18
action_91 (27) = happyShift action_19
action_91 (28) = happyShift action_20
action_91 (29) = happyShift action_21
action_91 (30) = happyShift action_22
action_91 (31) = happyShift action_23
action_91 (32) = happyShift action_24
action_91 (33) = happyShift action_25
action_91 (34) = happyShift action_26
action_91 (35) = happyShift action_27
action_91 (36) = happyShift action_28
action_91 (37) = happyShift action_29
action_91 (38) = happyShift action_30
action_91 (40) = happyShift action_31
action_91 (41) = happyShift action_32
action_91 (42) = happyShift action_33
action_91 (43) = happyShift action_34
action_91 (44) = happyShift action_35
action_91 (45) = happyShift action_36
action_91 (46) = happyShift action_37
action_91 (47) = happyShift action_38
action_91 (5) = happyGoto action_129
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (50) = happyShift action_44
action_92 (51) = happyShift action_45
action_92 (52) = happyShift action_46
action_92 (53) = happyShift action_47
action_92 (54) = happyShift action_48
action_92 (57) = happyShift action_49
action_92 (58) = happyShift action_50
action_92 (59) = happyShift action_51
action_92 (60) = happyShift action_52
action_92 (61) = happyShift action_53
action_92 (62) = happyShift action_54
action_92 (63) = happyShift action_55
action_92 (65) = happyShift action_56
action_92 (67) = happyShift action_61
action_92 (79) = happyShift action_62
action_92 (6) = happyGoto action_59
action_92 (10) = happyGoto action_128
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (50) = happyShift action_44
action_93 (51) = happyShift action_45
action_93 (52) = happyShift action_46
action_93 (53) = happyShift action_47
action_93 (54) = happyShift action_48
action_93 (57) = happyShift action_49
action_93 (58) = happyShift action_50
action_93 (59) = happyShift action_51
action_93 (60) = happyShift action_52
action_93 (61) = happyShift action_53
action_93 (62) = happyShift action_54
action_93 (63) = happyShift action_55
action_93 (65) = happyShift action_56
action_93 (67) = happyShift action_61
action_93 (79) = happyShift action_62
action_93 (6) = happyGoto action_59
action_93 (10) = happyGoto action_127
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (50) = happyShift action_44
action_94 (51) = happyShift action_45
action_94 (52) = happyShift action_46
action_94 (53) = happyShift action_47
action_94 (54) = happyShift action_48
action_94 (57) = happyShift action_49
action_94 (58) = happyShift action_50
action_94 (59) = happyShift action_51
action_94 (60) = happyShift action_52
action_94 (61) = happyShift action_53
action_94 (62) = happyShift action_54
action_94 (63) = happyShift action_55
action_94 (65) = happyShift action_56
action_94 (67) = happyShift action_57
action_94 (6) = happyGoto action_126
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (50) = happyShift action_44
action_95 (51) = happyShift action_45
action_95 (52) = happyShift action_46
action_95 (53) = happyShift action_47
action_95 (54) = happyShift action_48
action_95 (57) = happyShift action_49
action_95 (58) = happyShift action_50
action_95 (59) = happyShift action_51
action_95 (60) = happyShift action_52
action_95 (61) = happyShift action_53
action_95 (62) = happyShift action_54
action_95 (63) = happyShift action_55
action_95 (65) = happyShift action_56
action_95 (67) = happyShift action_57
action_95 (6) = happyGoto action_125
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (50) = happyShift action_44
action_96 (51) = happyShift action_45
action_96 (52) = happyShift action_46
action_96 (53) = happyShift action_47
action_96 (54) = happyShift action_48
action_96 (57) = happyShift action_49
action_96 (58) = happyShift action_50
action_96 (59) = happyShift action_51
action_96 (60) = happyShift action_52
action_96 (61) = happyShift action_53
action_96 (62) = happyShift action_54
action_96 (63) = happyShift action_55
action_96 (65) = happyShift action_56
action_96 (67) = happyShift action_57
action_96 (6) = happyGoto action_124
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (50) = happyShift action_44
action_97 (51) = happyShift action_45
action_97 (52) = happyShift action_46
action_97 (53) = happyShift action_47
action_97 (54) = happyShift action_48
action_97 (57) = happyShift action_49
action_97 (58) = happyShift action_50
action_97 (59) = happyShift action_51
action_97 (60) = happyShift action_52
action_97 (61) = happyShift action_53
action_97 (62) = happyShift action_54
action_97 (63) = happyShift action_55
action_97 (65) = happyShift action_56
action_97 (67) = happyShift action_57
action_97 (6) = happyGoto action_123
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (50) = happyShift action_44
action_98 (51) = happyShift action_45
action_98 (52) = happyShift action_46
action_98 (53) = happyShift action_47
action_98 (54) = happyShift action_48
action_98 (57) = happyShift action_49
action_98 (58) = happyShift action_50
action_98 (59) = happyShift action_51
action_98 (60) = happyShift action_52
action_98 (61) = happyShift action_53
action_98 (62) = happyShift action_54
action_98 (63) = happyShift action_55
action_98 (65) = happyShift action_56
action_98 (67) = happyShift action_57
action_98 (6) = happyGoto action_122
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (50) = happyShift action_44
action_99 (51) = happyShift action_45
action_99 (52) = happyShift action_46
action_99 (53) = happyShift action_47
action_99 (54) = happyShift action_48
action_99 (57) = happyShift action_49
action_99 (58) = happyShift action_50
action_99 (59) = happyShift action_51
action_99 (60) = happyShift action_52
action_99 (61) = happyShift action_53
action_99 (62) = happyShift action_54
action_99 (63) = happyShift action_55
action_99 (65) = happyShift action_56
action_99 (67) = happyShift action_57
action_99 (6) = happyGoto action_121
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (11) = happyShift action_3
action_100 (12) = happyShift action_4
action_100 (13) = happyShift action_5
action_100 (14) = happyShift action_6
action_100 (15) = happyShift action_7
action_100 (16) = happyShift action_8
action_100 (17) = happyShift action_9
action_100 (18) = happyShift action_10
action_100 (19) = happyShift action_11
action_100 (20) = happyShift action_12
action_100 (21) = happyShift action_13
action_100 (22) = happyShift action_14
action_100 (23) = happyShift action_15
action_100 (24) = happyShift action_16
action_100 (25) = happyShift action_17
action_100 (26) = happyShift action_18
action_100 (27) = happyShift action_19
action_100 (28) = happyShift action_20
action_100 (29) = happyShift action_21
action_100 (30) = happyShift action_22
action_100 (31) = happyShift action_23
action_100 (32) = happyShift action_24
action_100 (33) = happyShift action_25
action_100 (34) = happyShift action_26
action_100 (35) = happyShift action_27
action_100 (36) = happyShift action_28
action_100 (37) = happyShift action_29
action_100 (38) = happyShift action_30
action_100 (40) = happyShift action_31
action_100 (41) = happyShift action_32
action_100 (42) = happyShift action_33
action_100 (43) = happyShift action_34
action_100 (44) = happyShift action_35
action_100 (45) = happyShift action_36
action_100 (46) = happyShift action_37
action_100 (47) = happyShift action_38
action_100 (5) = happyGoto action_120
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (68) = happyShift action_119
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_51

action_103 _ = happyReduce_54

action_104 (50) = happyShift action_44
action_104 (51) = happyShift action_45
action_104 (52) = happyShift action_46
action_104 (53) = happyShift action_47
action_104 (54) = happyShift action_48
action_104 (57) = happyShift action_49
action_104 (58) = happyShift action_50
action_104 (59) = happyShift action_51
action_104 (60) = happyShift action_52
action_104 (61) = happyShift action_53
action_104 (62) = happyShift action_54
action_104 (63) = happyShift action_55
action_104 (65) = happyShift action_56
action_104 (67) = happyShift action_57
action_104 (6) = happyGoto action_117
action_104 (8) = happyGoto action_118
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (48) = happyShift action_103
action_105 (49) = happyShift action_104
action_105 (67) = happyShift action_105
action_105 (7) = happyGoto action_116
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_50

action_107 _ = happyReduce_49

action_108 (48) = happyShift action_103
action_108 (49) = happyShift action_104
action_108 (67) = happyShift action_105
action_108 (7) = happyGoto action_115
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_47

action_110 _ = happyReduce_46

action_111 _ = happyReduce_45

action_112 _ = happyReduce_44

action_113 (70) = happyShift action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (50) = happyShift action_44
action_114 (51) = happyShift action_45
action_114 (52) = happyShift action_46
action_114 (53) = happyShift action_47
action_114 (54) = happyShift action_48
action_114 (57) = happyShift action_49
action_114 (58) = happyShift action_50
action_114 (59) = happyShift action_51
action_114 (60) = happyShift action_52
action_114 (61) = happyShift action_53
action_114 (62) = happyShift action_54
action_114 (63) = happyShift action_55
action_114 (65) = happyShift action_56
action_114 (67) = happyShift action_61
action_114 (79) = happyShift action_62
action_114 (6) = happyGoto action_59
action_114 (10) = happyGoto action_144
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_48

action_116 (68) = happyShift action_143
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (50) = happyShift action_44
action_117 (51) = happyShift action_45
action_117 (52) = happyShift action_46
action_117 (53) = happyShift action_47
action_117 (54) = happyShift action_48
action_117 (57) = happyShift action_49
action_117 (58) = happyShift action_50
action_117 (59) = happyShift action_51
action_117 (60) = happyShift action_52
action_117 (61) = happyShift action_53
action_117 (62) = happyShift action_54
action_117 (63) = happyShift action_55
action_117 (65) = happyShift action_56
action_117 (67) = happyShift action_57
action_117 (6) = happyGoto action_117
action_117 (8) = happyGoto action_142
action_117 _ = happyReduce_57

action_118 _ = happyReduce_55

action_119 _ = happyReduce_53

action_120 (70) = happyShift action_141
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_66

action_122 _ = happyReduce_64

action_123 _ = happyReduce_65

action_124 _ = happyReduce_63

action_125 _ = happyReduce_62

action_126 _ = happyReduce_61

action_127 (77) = happyShift action_92
action_127 _ = happyReduce_68

action_128 _ = happyReduce_67

action_129 (70) = happyShift action_140
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_70

action_131 (50) = happyShift action_44
action_131 (51) = happyShift action_45
action_131 (52) = happyShift action_46
action_131 (53) = happyShift action_47
action_131 (54) = happyShift action_48
action_131 (57) = happyShift action_49
action_131 (58) = happyShift action_50
action_131 (59) = happyShift action_51
action_131 (60) = happyShift action_52
action_131 (61) = happyShift action_53
action_131 (62) = happyShift action_54
action_131 (63) = happyShift action_55
action_131 (65) = happyShift action_56
action_131 (67) = happyShift action_57
action_131 (6) = happyGoto action_139
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_32

action_133 (54) = happyShift action_85
action_133 (9) = happyGoto action_138
action_133 _ = happyReduce_59

action_134 (39) = happyShift action_137
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (70) = happyShift action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_28

action_137 _ = happyReduce_30

action_138 _ = happyReduce_60

action_139 (50) = happyShift action_44
action_139 (51) = happyShift action_45
action_139 (52) = happyShift action_46
action_139 (53) = happyShift action_47
action_139 (54) = happyShift action_48
action_139 (57) = happyShift action_49
action_139 (58) = happyShift action_50
action_139 (59) = happyShift action_51
action_139 (60) = happyShift action_52
action_139 (61) = happyShift action_53
action_139 (62) = happyShift action_54
action_139 (63) = happyShift action_55
action_139 (65) = happyShift action_56
action_139 (67) = happyShift action_57
action_139 (70) = happyShift action_146
action_139 (6) = happyGoto action_145
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_35

action_141 _ = happyReduce_37

action_142 _ = happyReduce_58

action_143 _ = happyReduce_56

action_144 (77) = happyShift action_92
action_144 (78) = happyShift action_93
action_144 _ = happyReduce_39

action_145 (70) = happyShift action_148
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (69) = happyShift action_147
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (11) = happyShift action_3
action_147 (12) = happyShift action_4
action_147 (13) = happyShift action_5
action_147 (14) = happyShift action_6
action_147 (15) = happyShift action_7
action_147 (16) = happyShift action_8
action_147 (17) = happyShift action_9
action_147 (18) = happyShift action_10
action_147 (19) = happyShift action_11
action_147 (20) = happyShift action_12
action_147 (21) = happyShift action_13
action_147 (22) = happyShift action_14
action_147 (23) = happyShift action_15
action_147 (24) = happyShift action_16
action_147 (25) = happyShift action_17
action_147 (26) = happyShift action_18
action_147 (27) = happyShift action_19
action_147 (28) = happyShift action_20
action_147 (29) = happyShift action_21
action_147 (30) = happyShift action_22
action_147 (31) = happyShift action_23
action_147 (32) = happyShift action_24
action_147 (33) = happyShift action_25
action_147 (34) = happyShift action_26
action_147 (35) = happyShift action_27
action_147 (36) = happyShift action_28
action_147 (37) = happyShift action_29
action_147 (38) = happyShift action_30
action_147 (40) = happyShift action_31
action_147 (41) = happyShift action_32
action_147 (42) = happyShift action_33
action_147 (43) = happyShift action_34
action_147 (44) = happyShift action_35
action_147 (45) = happyShift action_36
action_147 (46) = happyShift action_37
action_147 (47) = happyShift action_38
action_147 (5) = happyGoto action_150
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (69) = happyShift action_149
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (11) = happyShift action_3
action_149 (12) = happyShift action_4
action_149 (13) = happyShift action_5
action_149 (14) = happyShift action_6
action_149 (15) = happyShift action_7
action_149 (16) = happyShift action_8
action_149 (17) = happyShift action_9
action_149 (18) = happyShift action_10
action_149 (19) = happyShift action_11
action_149 (20) = happyShift action_12
action_149 (21) = happyShift action_13
action_149 (22) = happyShift action_14
action_149 (23) = happyShift action_15
action_149 (24) = happyShift action_16
action_149 (25) = happyShift action_17
action_149 (26) = happyShift action_18
action_149 (27) = happyShift action_19
action_149 (28) = happyShift action_20
action_149 (29) = happyShift action_21
action_149 (30) = happyShift action_22
action_149 (31) = happyShift action_23
action_149 (32) = happyShift action_24
action_149 (33) = happyShift action_25
action_149 (34) = happyShift action_26
action_149 (35) = happyShift action_27
action_149 (36) = happyShift action_28
action_149 (37) = happyShift action_29
action_149 (38) = happyShift action_30
action_149 (40) = happyShift action_31
action_149 (41) = happyShift action_32
action_149 (42) = happyShift action_33
action_149 (43) = happyShift action_34
action_149 (44) = happyShift action_35
action_149 (45) = happyShift action_36
action_149 (46) = happyShift action_37
action_149 (47) = happyShift action_38
action_149 (5) = happyGoto action_152
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (70) = happyShift action_151
action_150 _ = happyFail (happyExpListPerState 150)

action_151 _ = happyReduce_33

action_152 (70) = happyShift action_153
action_152 _ = happyFail (happyExpListPerState 152)

action_153 _ = happyReduce_34

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Ford happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Ford happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Back happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Back happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Right happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  5 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Right happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  5 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Left happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  5 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Left happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn5
		 (Clear
	)

happyReduce_12 = happySpecReduce_1  5 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn5
		 (Clear
	)

happyReduce_13 = happySpecReduce_1  5 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn5
		 (Clean
	)

happyReduce_14 = happySpecReduce_1  5 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn5
		 (PUp
	)

happyReduce_15 = happySpecReduce_1  5 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn5
		 (PUp
	)

happyReduce_16 = happySpecReduce_1  5 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn5
		 (PDown
	)

happyReduce_17 = happySpecReduce_1  5 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn5
		 (PDown
	)

happyReduce_18 = happySpecReduce_1  5 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn5
		 (HideT
	)

happyReduce_19 = happySpecReduce_1  5 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn5
		 (HideT
	)

happyReduce_20 = happySpecReduce_1  5 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn5
		 (ShowT
	)

happyReduce_21 = happySpecReduce_1  5 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn5
		 (ShowT
	)

happyReduce_22 = happySpecReduce_1  5 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn5
		 (Home
	)

happyReduce_23 = happySpecReduce_2  5 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SetX happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  5 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SetY happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  5 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SetXY happy_var_2 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  5 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SetHead happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  5 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SetHead happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 5 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Rep happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_2  5 happyReduction_29
happyReduction_29 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Print happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 5 5 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Def happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_2  5 happyReduction_31
happyReduction_31 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (SetCo happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 4 5 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DefV happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 9 5 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (For happy_var_3 happy_var_4 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 10 5 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ForDelta happy_var_3 happy_var_4 happy_var_5 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 5 5 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_1  5 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn5
		 (Fill
	)

happyReduce_37 = happyReduce 5 5 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Filled happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_2  5 happyReduction_38
happyReduction_38 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Wait happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 5 5 happyReduction_39
happyReduction_39 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_1  6 happyReduction_40
happyReduction_40 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn6
		 (Num happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  6 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn6
		 (XCor
	)

happyReduce_42 = happySpecReduce_1  6 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn6
		 (YCor
	)

happyReduce_43 = happySpecReduce_1  6 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn6
		 (Heading
	)

happyReduce_44 = happySpecReduce_2  6 happyReduction_44
happyReduction_44 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Towards happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  6 happyReduction_45
happyReduction_45 (HappyTerminal (TokenVar happy_var_2))
	_
	 =  HappyAbsSyn6
		 (Var happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_2  6 happyReduction_46
happyReduction_46 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (First happy_var_2
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  6 happyReduction_47
happyReduction_47 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Last happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  6 happyReduction_48
happyReduction_48 (HappyAbsSyn7  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Item happy_var_2 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  6 happyReduction_49
happyReduction_49 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (RandItem happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  6 happyReduction_50
happyReduction_50 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Tail happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_2  6 happyReduction_51
happyReduction_51 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (RTail happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  6 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn6
		 (Read
	)

happyReduce_53 = happySpecReduce_3  6 happyReduction_53
happyReduction_53 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  7 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn7
		 (Pos
	)

happyReduce_55 = happySpecReduce_2  7 happyReduction_55
happyReduction_55 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (L happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  7 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  8 happyReduction_57
happyReduction_57 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  8 happyReduction_58
happyReduction_58 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_2  9 happyReduction_59
happyReduction_59 (HappyTerminal (TokenVar happy_var_2))
	_
	 =  HappyAbsSyn9
		 ([happy_var_2]
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  9 happyReduction_60
happyReduction_60 (HappyAbsSyn9  happy_var_3)
	(HappyTerminal (TokenVar happy_var_2))
	_
	 =  HappyAbsSyn9
		 (happy_var_2 : happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  10 happyReduction_61
happyReduction_61 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (Gt happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  10 happyReduction_62
happyReduction_62 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (Lt happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  10 happyReduction_63
happyReduction_63 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  10 happyReduction_64
happyReduction_64 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (GEq happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  10 happyReduction_65
happyReduction_65 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (LEq happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  10 happyReduction_66
happyReduction_66 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (Diff happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  10 happyReduction_67
happyReduction_67 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (And happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  10 happyReduction_68
happyReduction_68 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Or happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_2  10 happyReduction_69
happyReduction_69 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Not happy_var_2
	)
happyReduction_69 _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  10 happyReduction_70
happyReduction_70 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 80 80 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFod -> cont 11;
	TokenFd -> cont 12;
	TokenBak -> cont 13;
	TokenBk -> cont 14;
	TokenRit -> cont 15;
	TokenRt -> cont 16;
	TokenLet -> cont 17;
	TokenLt -> cont 18;
	TokenCls -> cont 19;
	TokenCs -> cont 20;
	TokenCln -> cont 21;
	TokenPup -> cont 22;
	TokenPu -> cont 23;
	TokenPdn -> cont 24;
	TokenPd -> cont 25;
	TokenHte -> cont 26;
	TokenHt -> cont 27;
	TokenSte -> cont 28;
	TokenSt -> cont 29;
	TokenHome -> cont 30;
	TokenStx -> cont 31;
	TokenSty -> cont 32;
	TokenStxy -> cont 33;
	TokenSethead -> cont 34;
	TokenSeth -> cont 35;
	TokenRep -> cont 36;
	TokenPrnt -> cont 37;
	TokenTo -> cont 38;
	TokenEnd -> cont 39;
	TokenSetCol -> cont 40;
	TokenMk -> cont 41;
	TokenFor -> cont 42;
	TokenIf -> cont 43;
	TokenFill -> cont 44;
	TokenFilled -> cont 45;
	TokenWait -> cont 46;
	TokenWhile -> cont 47;
	TokenPos -> cont 48;
	TokenList -> cont 49;
	TokenXCor -> cont 50;
	TokenYCor -> cont 51;
	TokenHead -> cont 52;
	TokenTow -> cont 53;
	TokenRef -> cont 54;
	TokenSum -> cont 55;
	TokenDiff -> cont 56;
	TokenFst -> cont 57;
	TokenLst -> cont 58;
	TokenItem -> cont 59;
	TokenPick -> cont 60;
	TokenTail -> cont 61;
	TokenRTail -> cont 62;
	TokenRead -> cont 63;
	TokenVar happy_dollar_dollar -> cont 64;
	TokenNum happy_dollar_dollar -> cont 65;
	TokenStr -> cont 66;
	TokenPA -> cont 67;
	TokenPC -> cont 68;
	TokenCA -> cont 69;
	TokenCC -> cont 70;
	TokenMayor -> cont 71;
	TokenMenor -> cont 72;
	TokenIgual -> cont 73;
	TokenMaIgual -> cont 74;
	TokenMeIgual -> cont 75;
	TokenNoIgual -> cont 76;
	TokenY -> cont 77;
	TokenO -> cont 78;
	TokenNo -> cont 79;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 80 tk tks = happyError' (tks, explist)
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
             | TokenNum Float
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
