FasdUAS 1.101.10   ��   ��    k             l     ��  ��    5 /-----------------------------------------------     � 	 	 ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   
  
 l     ��  ��    0 * AppleScript to create a new list for the      �   T   A p p l e S c r i p t   t o   c r e a t e   a   n e w   l i s t   f o r   t h e        l     ��  ��    2 , currently selected task(s) in The Hit List.     �   X   c u r r e n t l y   s e l e c t e d   t a s k ( s )   i n   T h e   H i t   L i s t .      l     ��  ��    3 - The task the list was created from will be       �   Z   T h e   t a s k   t h e   l i s t   w a s   c r e a t e d   f r o m   w i l l   b e          l     ��  ��      moved into the new list.     �   2   m o v e d   i n t o   t h e   n e w   l i s t .      l     ��������  ��  ��       !   l     �� " #��   "   Author: David Hutchison    # � $ $ 0   A u t h o r :   D a v i d   H u t c h i s o n !  % & % l     �� ' (��   ' , & WWW: devwithimagination.wordpress.com    ( � ) ) L   W W W :   d e v w i t h i m a g i n a t i o n . w o r d p r e s s . c o m &  * + * l     �� , -��   , 5 /-----------------------------------------------    - � . . ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  /�� / l   � 0���� 0 O    � 1 2 1 k   � 3 3  4 5 4 l   ��������  ��  ��   5  6 7 6 r    	 8 9 8 1    ��
�� 
Tsel 9 o      ���� $0 currentselection currentSelection 7  : ; : l  
 
��������  ��  ��   ;  < = < X   
� >�� ? > k   � @ @  A B A l   ��������  ��  ��   B  C D C r     E F E n     G H G 1    ��
�� 
Ttit H o    ���� 0 thetask theTask F o      ���� 0 listname listName D  I J I l     ��������  ��  ��   J  K L K O    3 M N M I  & 2���� O
�� .corecrel****      � null��   O �� P Q
�� 
kocl P m   ( )��
�� 
List Q �� R��
�� 
prdt R K   * . S S �� T��
�� 
pnam T o   + ,���� 0 listname listName��  ��   N 1     #��
�� 
Tfld L  U V U l  4 4��������  ��  ��   V  W X W r   4 7 Y Z Y 1   4 5��
�� 
rslt Z o      ���� 0 newlist newList X  [ \ [ l  8 8��������  ��  ��   \  ] ^ ] l  8 8�� _ `��   _ 9 3for some reason both "move theTask to newList" and     ` � a a f f o r   s o m e   r e a s o n   b o t h   " m o v e   t h e T a s k   t o   n e w L i s t "   a n d   ^  b c b l  8 8�� d e��   d 2 ,"duplicate theTask to newList" fail with an     e � f f X " d u p l i c a t e   t h e T a s k   t o   n e w L i s t "   f a i l   w i t h   a n   c  g h g l  8 8�� i j��   i < 6"Can�t make or move that element into that container".    j � k k l " C a n  t   m a k e   o r   m o v e   t h a t   e l e m e n t   i n t o   t h a t   c o n t a i n e r " . h  l m l l  8 8�� n o��   n @ :Falling back to manually recreating the task with as much     o � p p t F a l l i n g   b a c k   t o   m a n u a l l y   r e c r e a t i n g   t h e   t a s k   w i t h   a s   m u c h   m  q r q l  8 8�� s t��   s " information as we can gather    t � u u 8 i n f o r m a t i o n   a s   w e   c a n   g a t h e r r  v w v l  8 8��������  ��  ��   w  x y x l  8 8��������  ��  ��   y  z { z r   8 A | } | n   8 = ~  ~ 1   9 =��
�� 
Tnts  o   8 9���� 0 thetask theTask } o      ���� 0 	tasknotes 	taskNotes {  � � � r   B K � � � n   B G � � � 1   C G��
�� 
Tstd � o   B C���� 0 thetask theTask � o      ���� 0 tasksd taskSD �  � � � r   L U � � � n   L Q � � � 1   M Q��
�� 
Tdud � o   L M���� 0 thetask theTask � o      ���� 0 taskdd taskDD �  � � � r   V _ � � � n   V [ � � � 1   W [��
�� 
Test � o   V W���� 0 thetask theTask � o      ���� 0 tasket taskET �  � � � r   ` i � � � n   ` e � � � 1   a e��
�� 
Tact � o   ` a���� 0 thetask theTask � o      ���� 0 taskat taskAT �  � � � r   j s � � � n   j o � � � 1   k o��
�� 
Tcnd � o   j k���� 0 thetask theTask � o      ���� 0 taskcandate taskCanDate �  � � � r   t } � � � n   t y � � � 1   u y��
�� 
Tcrd � o   t u���� 0 thetask theTask � o      ���� 0 taskcredate taskCreDate �  � � � r   ~ � � � � n   ~ � � � � 1    ���
�� 
Tmdd � o   ~ ���� 0 thetask theTask � o      ���� 0 taskmd taskMD �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
Tprt � o   � ����� 0 thetask theTask � o      ���� 0 taskpriority taskPriority �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
Tarc � o   � ����� 0 thetask theTask � o      ���� 0 taskarchived taskArchived �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
Tcan � o   � ����� 0 thetask theTask � o      ���� 0 taskcanceled taskCanceled �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
Tcom � o   � ����� 0 thetask theTask � o      ���� 0 taskcompleted taskCompleted �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
Tcod � o   � ����� 0 thetask theTask � o      ���� 0 taskcd taskCD �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �  Set the general items    � � � � * S e t   t h e   g e n e r a l   i t e m s �  � � � r   � � � � � K   � � � � �� � �
�� 
Ttit � o   � ����� 0 listname listName � �� � �
�� 
Tnts � o   � ����� 0 	tasknotes 	taskNotes � �� � �
�� 
Test � o   � ����� 0 tasket taskET � �� � �
�� 
Tact � o   � ����� 0 taskat taskAT � �� � �
�� 
Tprt � o   � ����� 0 taskpriority taskPriority � �� � �
�� 
Tarc � o   � ����� 0 taskarchived taskArchived � �� � �
�� 
Tcan � o   � ����� 0 taskcanceled taskCanceled � �� ���
�� 
Tcom � o   � ����� 0 taskcompleted taskCompleted��   � o      ���� 0 	taskprops 	taskProps �  � � � l  � ��� � ���   � * $Set the dates where they are defined    � � � � H S e t   t h e   d a t e s   w h e r e   t h e y   a r e   d e f i n e d �  � � � Z   � � ����� � l  � � ����� � >  � � � � � o   � ��� 0 tasksd taskSD � m   � ��~
�~ 
msng��  ��   � r   �	 � � � l  � ��}�| � b   � � � � o   � ��{�{ 0 	taskprops 	taskProps � K   � � � �z ��y
�z 
Tstd � o   ��x�x 0 tasksd taskSD�y  �}  �|   � o      �w�w 0 	taskprops 	taskProps��  ��   �  � � � l �v�u�t�v  �u  �t   �  � � � Z  , � ��s�r � l  ��q�p � >  � � � o  �o�o 0 taskdd taskDD � m  �n
�n 
msng�q  �p   � r  ( �  � l $�m�l b  $ o  �k�k 0 	taskprops 	taskProps K  # �j�i
�j 
Tdud o  !�h�h 0 taskdd taskDD�i  �m  �l    o      �g�g 0 	taskprops 	taskProps�s  �r   �  l --�f�e�d�f  �e  �d   	 Z  -K
�c�b
 l -4�a�` > -4 o  -0�_�_ 0 taskcandate taskCanDate m  03�^
�^ 
msng�a  �`   r  7G l 7C�]�\ b  7C o  7:�[�[ 0 	taskprops 	taskProps K  :B �Z�Y
�Z 
Tcnd o  =@�X�X 0 taskcandate taskCanDate�Y  �]  �\   o      �W�W 0 	taskprops 	taskProps�c  �b  	  l LL�V�U�T�V  �U  �T    Z  Lj�S�R l LS�Q�P > LS o  LO�O�O 0 taskcredate taskCreDate m  OR�N
�N 
msng�Q  �P   r  Vf  l Vb!�M�L! b  Vb"#" o  VY�K�K 0 	taskprops 	taskProps# K  Ya$$ �J%�I
�J 
Tcrd% o  \_�H�H 0 taskcredate taskCreDate�I  �M  �L    o      �G�G 0 	taskprops 	taskProps�S  �R   &'& l kk�F�E�D�F  �E  �D  ' ()( Z  k�*+�C�B* l kr,�A�@, > kr-.- o  kn�?�? 0 taskcd taskCD. m  nq�>
�> 
msng�A  �@  + r  u�/0/ l u�1�=�<1 b  u�232 o  ux�;�; 0 	taskprops 	taskProps3 K  x�44 �:5�9�: 0 completeddate completedDate5 o  {~�8�8 0 taskcd taskCD�9  �=  �<  0 o      �7�7 0 	taskprops 	taskProps�C  �B  ) 676 l ���6�5�4�6  �5  �4  7 898 l ���3�2�1�3  �2  �1  9 :;: l ���0<=�0  < 3 - create the copy of this task in the new list   = �>> Z   c r e a t e   t h e   c o p y   o f   t h i s   t a s k   i n   t h e   n e w   l i s t; ?@? l ���/�.�-�/  �.  �-  @ ABA O ��CDC I ���,�+E
�, .corecrel****      � null�+  E �*FG
�* 
koclF m  ���)
�) 
TaskG �(H�'
�( 
prdtH o  ���&�& 0 	taskprops 	taskProps�'  D o  ���%�% 0 newlist newListB IJI l ���$�#�"�$  �#  �"  J KLK l ���!� ��!  �   �  L MNM I ���O�
� .coredelonull���     obj O o  ���� 0 thetask theTask�  N P�P l ������  �  �  �  �� 0 thetask theTask ? o    �� $0 currentselection currentSelection = Q�Q l ������  �  �  �   2 m     RR�                                                                                      @ alis    d  Macintosh HD               �NH+   
zThe Hit List.app                                                f/�SX        ����  	                Applications    �N      �EH     
z  *Macintosh HD:Applications:The Hit List.app  "  T h e   H i t   L i s t . a p p    M a c i n t o s h   H D  Applications/The Hit List.app   / ��  ��  ��  ��       �ST�  S �
� .aevtoappnull  �   � ****T �U��VW�
� .aevtoappnull  �   � ****U k    �XX  /��  �  �  V �� 0 thetask theTaskW 0R�
�	��������� ������������������������������������������������������������������������
�
 
Tsel�	 $0 currentselection currentSelection
� 
kocl
� 
cobj
� .corecnte****       ****
� 
Ttit� 0 listname listName
� 
Tfld
� 
List
� 
prdt
�  
pnam�� 
�� .corecrel****      � null
�� 
rslt�� 0 newlist newList
�� 
Tnts�� 0 	tasknotes 	taskNotes
�� 
Tstd�� 0 tasksd taskSD
�� 
Tdud�� 0 taskdd taskDD
�� 
Test�� 0 tasket taskET
�� 
Tact�� 0 taskat taskAT
�� 
Tcnd�� 0 taskcandate taskCanDate
�� 
Tcrd�� 0 taskcredate taskCreDate
�� 
Tmdd�� 0 taskmd taskMD
�� 
Tprt�� 0 taskpriority taskPriority
�� 
Tarc�� 0 taskarchived taskArchived
�� 
Tcan�� 0 taskcanceled taskCanceled
�� 
Tcom�� 0 taskcompleted taskCompleted
�� 
Tcod�� 0 taskcd taskCD�� �� 0 	taskprops 	taskProps
�� 
msng�� 0 completeddate completedDate
�� 
Task
�� .coredelonull���     obj ����*�,E�O��[��l kh  ��,E�O*�, *�����l� UO�E�O�a ,E` O�a ,E` O�a ,E` O�a ,E` O�a ,E` O�a ,E` O�a ,E` O�a ,E` O�a  ,E` !O�a ",E` #O�a $,E` %O�a &,E` 'O�a (,E` )O��a _ a _ a _ a  _ !a "_ #a $_ %a &_ 'a *E` +O_ a , _ +a _ l%E` +Y hO_ a , _ +a _ l%E` +Y hO_ a , _ +a _ l%E` +Y hO_ a , _ +a _ l%E` +Y hO_ )a , _ +a -_ )l%E` +Y hO� *�a .�_ +� UO�j /OP[OY�pOPU ascr  ��ޭ