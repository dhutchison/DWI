FasdUAS 1.101.10   ��   ��    k             l     ��  ��    3 -Script to add a photo from iPhoto to DayOne.      � 	 	 Z S c r i p t   t o   a d d   a   p h o t o   f r o m   i P h o t o   t o   D a y O n e .     
  
 l     ��  ��    � zBased on script by Jordan Patterson and posted originally at http://jordanpatterson.me/post/28961089470/aperture-to-dayone     �   � B a s e d   o n   s c r i p t   b y   J o r d a n   P a t t e r s o n   a n d   p o s t e d   o r i g i n a l l y   a t   h t t p : / / j o r d a n p a t t e r s o n . m e / p o s t / 2 8 9 6 1 0 8 9 4 7 0 / a p e r t u r e - t o - d a y o n e      l     ��  ��    8 2Feel free to modify, reuse, and repost this script     �   d F e e l   f r e e   t o   m o d i f y ,   r e u s e ,   a n d   r e p o s t   t h i s   s c r i p t      l     ��������  ��  ��        l    ` ����  O     `    k    _       r    
    l     ����   e     ! ! 1    ��
�� 
selc��  ��    o      ���� 0 imagesel imageSel   "�� " Y    _ #�� $ %�� # k    Z & &  ' ( ' l   ��������  ��  ��   (  ) * ) l   �� + ,��   + u o This script uses the date and time attached to the image to set the date and time of the Day One journal entry    , � - - �   T h i s   s c r i p t   u s e s   t h e   d a t e   a n d   t i m e   a t t a c h e d   t o   t h e   i m a g e   t o   s e t   t h e   d a t e   a n d   t i m e   o f   t h e   D a y   O n e   j o u r n a l   e n t r y *  . / . r    ! 0 1 0 n     2 3 2 1    ��
�� 
idat 3 l    4���� 4 n     5 6 5 4    �� 7
�� 
cobj 7 o    ���� 0 i   6 o    ���� 0 imagesel imageSel��  ��   1 o      ���� 0 thedate theDate /  8 9 8 l  " "��������  ��  ��   9  : ; : r   " ) < = < c   " ' > ? > n   " % @ A @ 1   # %��
�� 
year A o   " #���� 0 thedate theDate ? m   % &��
�� 
long = o      ���� 0 theyear theYear ;  B C B r   * 1 D E D c   * / F G F n   * - H I H m   + -��
�� 
mnth I o   * +���� 0 thedate theDate G m   - .��
�� 
long E o      ���� 0 themonth theMonth C  J K J r   2 9 L M L c   2 7 N O N n   2 5 P Q P 1   3 5��
�� 
day  Q o   2 3���� 0 thedate theDate O m   5 6��
�� 
long M o      ���� 0 theday theDay K  R S R r   : A T U T c   : ? V W V n   : = X Y X 1   ; =��
�� 
hour Y o   : ;���� 0 thedate theDate W m   = >��
�� 
long U o      ���� 0 thehour theHour S  Z [ Z r   B M \ ] \ c   B I ^ _ ^ n   B G ` a ` 1   C G��
�� 
min  a o   B C���� 0 thedate theDate _ m   G H��
�� 
long ] o      ���� 0 themin theMin [  b c b l  N N��������  ��  ��   c  d�� d r   N Z e f e n   N V g h g 1   R V��
�� 
ipth h l  N R i���� i n   N R j k j 4   O R�� l
�� 
cobj l o   P Q���� 0 i   k o   N O���� 0 imagesel imageSel��  ��   f o      ���� 0 theexportpath theExportPath��  �� 0 i   $ m    ����  % I   �� m��
�� .corecnte****       **** m o    ���� 0 imagesel imageSel��  ��  ��    m      n n�                                                                                  iPho  alis    N  Macintosh HD               �NH+  ?؄
iPhoto.app                                                      sIș��        ����  	                Applications    �N      ș��    ?؄  %Macintosh HD:Applications: iPhoto.app    
 i P h o t o . a p p    M a c i n t o s h   H D  Applications/iPhoto.app   / ��  ��  ��     o p o l     ��������  ��  ��   p  q r q l  a t s���� s r   a t t u t c   a r v w v b   a n x y x b   a l z { z b   a h | } | b   a f ~  ~ o   a b���� 0 themonth theMonth  m   b e � � � � �  / } o   f g���� 0 theday theDay { m   h k � � � � �  / y o   l m���� 0 theyear theYear w m   n q��
�� 
TEXT u o      ���� 0 thedate theDate��  ��   r  � � � l  u | ����� � r   u | � � � m   u x � � � � �  A M � o      ���� 0 theap theAP��  ��   �  � � � l  } � ����� � Z   } � � ����� � A  } � � � � o   } ����� 0 themin theMin � m   � ����� 
 � r   � � � � � b   � � � � � m   � � � � � � �  0 � o   � ����� 0 themin theMin � o      ���� 0 themin theMin��  ��  ��  ��   �  � � � l  � � ����� � Z   � � � ����� � ?  � � � � � o   � ����� 0 thehour theHour � m   � �����  � k   � � � �  � � � r   � � � � � m   � � � � � � �  P M � o      ���� 0 theap theAP �  ��� � r   � � � � � \   � � � � � o   � ����� 0 thehour theHour � m   � �����  � o      ���� 0 thehour theHour��  ��  ��  ��  ��   �  � � � l  � � ����� � r   � � � � � c   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 thehour theHour � m   � � � � � � �  : � o   � ����� 0 themin theMin � m   � � � � � � �    � o   � ����� 0 theap theAP � m   � ���
�� 
TEXT � o      ���� 0 thetime theTime��  ��   �  � � � l  � � ����� � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � �  " � o   � ����� 0 thedate theDate � m   � � � � � � �    � o   � ����� 0 thetime theTime � m   � � � � � � �  " � o      ���� 0 thedatetime theDateTime��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  � � ����� � r   � � � � � c   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � H e c h o   " "   |   / u s r / l o c a l / b i n / d a y o n e   - p = ' � o   � ����� 0 theexportpath theExportPath � m   � � � � � � � 
 '   - d = � o   � ����� 0 thedatetime theDateTime � m   � � � � � � �    n e w � m   � ���
�� 
TEXT � o      ���� 0 	thescript 	theScript��  ��   �  � � � l     ��������  ��  ��   �  � � � l  �
 ����� � r   �
 � � � I  ��� ���
�� .sysoexecTEXT���     TEXT � o   ��� 0 	thescript 	theScript��   � o      �~�~ 0 theentry theEntry��  ��   �  � � � l  ��}�| � r   � � � l  ��{�z � n   � � � 1  �y
�y 
leng � o  �x�x 0 theentry theEntry�{  �z   � o      �w�w 0 	thelength 	theLength�}  �|   �  � � � l " ��v�u � r  " � � � \   �  � o  �t�t 0 	thelength 	theLength  m  �s�s ' � o      �r�r 0 thestart theStart�v  �u   �  l #.�q�p r  #. \  #* o  #&�o�o 0 	thelength 	theLength m  &)�n�n  o      �m�m 0 theend theEnd�q  �p   	 l /F
�l�k
 r  /F n  /B 7 2B�j
�j 
ctxt o  8<�i�i 0 thestart theStart o  =A�h�h 0 theend theEnd o  /2�g�g 0 theentry theEntry o      �f�f 0 theudid theUDID�l  �k  	  l     �e�d�c�e  �d  �c    l     �b�a�`�b  �a  �`   �_ l GV�^�] I GV�\�[
�\ .sysoexecTEXT���     TEXT b  GR b  GN m  GJ � 8 o p e n   d a y o n e : / / e d i t ? e n t r y I d = ' o  JM�Z�Z 0 theudid theUDID m  NQ �  '�[  �^  �]  �_       "�Y !"#�X�W�V�U�T$ �%&'(�S�R�Q)�P�O�N�M�L�K�J�I�H�G�F�E�D�C�Y     �B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#
�B .aevtoappnull  �   � ****�A 0 imagesel imageSel�@ 0 thedate theDate�? 0 theyear theYear�> 0 themonth theMonth�= 0 theday theDay�< 0 thehour theHour�; 0 themin theMin�: 0 theexportpath theExportPath�9 0 theap theAP�8 0 thetime theTime�7 0 thedatetime theDateTime�6 0 	thescript 	theScript�5 0 theentry theEntry�4 0 	thelength 	theLength�3 0 thestart theStart�2 0 theend theEnd�1 0 theudid theUDID�0  �/  �.  �-  �,  �+  �*  �)  �(  �'  �&  �%  �$  �#  ! �"*�!� +,�
�" .aevtoappnull  �   � ***** k    V--  ..  q//  �00  �11  �22  �33  �44  �55  �66  �77  �88 99 :: ��  �!  �   + �� 0 i  , 4 n�������������������
 � ��	 ��� �� � � �� � � �� � � ����� ��������������
� 
selc� 0 imagesel imageSel
� .corecnte****       ****
� 
cobj
� 
idat� 0 thedate theDate
� 
year
� 
long� 0 theyear theYear
� 
mnth� 0 themonth theMonth
� 
day � 0 theday theDay
� 
hour� 0 thehour theHour
� 
min � 0 themin theMin
� 
ipth�
 0 theexportpath theExportPath
�	 
TEXT� 0 theap theAP� 
� � 0 thetime theTime� 0 thedatetime theDateTime� 0 	thescript 	theScript
� .sysoexecTEXT���     TEXT� 0 theentry theEntry
�  
leng�� 0 	thelength 	theLength�� '�� 0 thestart theStart�� �� 0 theend theEnd
�� 
ctxt�� 0 theudid theUDID�W� ]*�,EE�O Sk�j kh  ��/�,E�O��,�&E�O��,�&E�O��,�&E�O��,�&E�O�a ,�&E` O��/a ,E` [OY��UO�a %�%a %�%a &E�Oa E` O_ a  a _ %E` Y hO�a  a E` O�a E�Y hO�a %_ %a %_ %a &E` Oa  �%a !%_ %a "%E` #Oa $_ %a %%_ #%a &%a &E` 'O_ 'j (E` )O_ )a *,E` +O_ +a ,E` -O_ +a .E` /O_ )[a 0\[Z_ -\Z_ /2E` 1Oa 2_ 1%a 3%j (" ��;�� ;  << ==  n��>��
�� 
ipmr> A� ǰ  
�� kfrmID  # �??  8 / 1 1 / 2 0 1 2�X��W �V �U 
�T ,$ �@@ � / U s e r s / d a v i d / P i c t u r e s / i P h o t o   L i b r a r y / M a s t e r s / 2 0 1 2 / 0 8 / 1 2 / 2 0 1 2 0 8 1 2 - 2 1 0 2 5 0 / 1 0 0 _ 2 2 0 2 . J P G% �AA  1 0 : 4 4   A M& �BB ( " 8 / 1 1 / 2 0 1 2   1 0 : 4 4   A M "' �CC* e c h o   " "   |   / u s r / l o c a l / b i n / d a y o n e   - p = ' / U s e r s / d a v i d / P i c t u r e s / i P h o t o   L i b r a r y / M a s t e r s / 2 0 1 2 / 0 8 / 1 2 / 2 0 1 2 0 8 1 2 - 2 1 0 2 5 0 / 1 0 0 _ 2 2 0 2 . J P G '   - d = " 8 / 1 1 / 2 0 1 2   1 0 : 4 4   A M "   n e w( �DD  N e w   e n t r y   :   ~ / L i b r a r y / M o b i l e   D o c u m e n t s / 5 U 8 N S 4 G X 8 2 ~ c o m ~ d a y o n e a p p ~ d a y o n e / D o c u m e n t s / J o u r n a l _ d a y o n e / e n t r i e s / B 4 6 5 2 E A A C 7 2 E 4 B C C 8 5 D 4 1 7 7 6 9 4 3 9 D 1 9 B . d o e n t r y�S ��R i�Q �) �EE @ B 4 6 5 2 E A A C 7 2 E 4 B C C 8 5 D 4 1 7 7 6 9 4 3 9 D 1 9 B�P  �O  �N  �M  �L  �K  �J  �I  �H  �G  �F  �E  �D  �C  ascr  ��ޭ