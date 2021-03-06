FasdUAS 1.101.10   ��   ��    k             l     ��  ��    5 /-----------------------------------------------     � 	 	 ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   
  
 l     ��  ��    � �Script to create a playlist containing some randomly selected, full, albums that have not been played in a given amount of time.     �    S c r i p t   t o   c r e a t e   a   p l a y l i s t   c o n t a i n i n g   s o m e   r a n d o m l y   s e l e c t e d ,   f u l l ,   a l b u m s   t h a t   h a v e   n o t   b e e n   p l a y e d   i n   a   g i v e n   a m o u n t   o f   t i m e .      l     ��������  ��  ��        l     ��  ��      Author: David Hutchison     �   0   A u t h o r :   D a v i d   H u t c h i s o n      l     ��  ��    , & WWW: devwithimagination.wordpress.com     �   L   W W W :   d e v w i t h i m a g i n a t i o n . w o r d p r e s s . c o m      l     ��  ��    5 /-----------------------------------------------     �   ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    ��   l   � !���� ! O    � " # " k   � $ $  % & % l   ��������  ��  ��   &  ' ( ' l   �� ) *��   )  Configuration values    * � + + ( C o n f i g u r a t i o n   v a l u e s (  , - , l   �� . /��   . ) #The playlist to use as the source.     / � 0 0 F T h e   p l a y l i s t   t o   u s e   a s   t h e   s o u r c e .   -  1 2 1 l   �� 3 4��   3 - 'This option specifies a named playlist.    4 � 5 5 N T h i s   o p t i o n   s p e c i f i e s   a   n a m e d   p l a y l i s t . 2  6 7 6 l   �� 8 9��   8 0 *set sourcePlaylist to playlist "_My Music"    9 � : : T s e t   s o u r c e P l a y l i s t   t o   p l a y l i s t   " _ M y   M u s i c " 7  ; < ; l   �� = >��   = < 6This option specifies to search the full music library    > � ? ? l T h i s   o p t i o n   s p e c i f i e s   t o   s e a r c h   t h e   f u l l   m u s i c   l i b r a r y <  @ A @ r    
 B C B 4    �� D
�� 
cLiP D m    ����  C o      ����  0 sourceplaylist sourcePlaylist A  E F E l   ��������  ��  ��   F  G H G l   �� I J��   I 8 2The number of days that music should be older than    J � K K d T h e   n u m b e r   o f   d a y s   t h a t   m u s i c   s h o u l d   b e   o l d e r   t h a n H  L M L r     N O N m    ����  O o      ���� 40 minimumdayssincelastplay minimumDaysSinceLastPlay M  P Q P l   ��������  ��  ��   Q  R S R l   �� T U��   T n hThe minimum percentage of the album that should be older than this. All is 1, none is 0 (don't do that).    U � V V � T h e   m i n i m u m   p e r c e n t a g e   o f   t h e   a l b u m   t h a t   s h o u l d   b e   o l d e r   t h a n   t h i s .   A l l   i s   1 ,   n o n e   i s   0   ( d o n ' t   d o   t h a t ) . S  W X W r     Y Z Y m     [ [ ?�       Z o      ���� ,0 minimumoldpercentage minimumOldPercentage X  \ ] \ l   ��������  ��  ��   ]  ^ _ ^ l   �� ` a��   ` > 8The minimum number of tracks the playlist should contain    a � b b p T h e   m i n i m u m   n u m b e r   o f   t r a c k s   t h e   p l a y l i s t   s h o u l d   c o n t a i n _  c d c r     e f e m    ���� 2 f o      ���� &0 minimumtrackcount minimumTrackCount d  g h g l   ��������  ��  ��   h  i j i l   �� k l��   k ^ XThe name of the playlist to populate. This will be created if it does not already exist.    l � m m � T h e   n a m e   o f   t h e   p l a y l i s t   t o   p o p u l a t e .   T h i s   w i l l   b e   c r e a t e d   i f   i t   d o e s   n o t   a l r e a d y   e x i s t . j  n o n r     p q p m     r r � s s  R a n d o m   A l b u m s q o      ���� 20 destinationplaylistname destinationPlaylistName o  t u t l   ��������  ��  ��   u  v w v l   �� x y��   x   Main Script body    y � z z "   M a i n   S c r i p t   b o d y w  { | { Z    . } ~��  } >     � � � 1    ��
�� 
pPlS � m    ��
�� ePlSkPSS ~ r   # ( � � � 1   # &��
�� 
pPla � o      ���� "0 currentplaylist currentPlaylist��    r   + . � � � m   + , � � � � �   � o      ���� "0 currentplaylist currentPlaylist |  � � � l  / /��������  ��  ��   �  ��� � Z   /� � ��� � � =  / 2 � � � o   / 0���� "0 currentplaylist currentPlaylist � o   0 1���� 20 destinationplaylistname destinationPlaylistName � I  5 B�� ���
�� .sysodlogaskr        TEXT � b   5 > � � � b   5 : � � � m   5 8 � � � � � @ S t o p   p l a y i n g   f r o m   t h e   p l a y l i s t   ' � o   8 9���� 20 destinationplaylistname destinationPlaylistName � m   : = � � � � � : '   b e f o r e   r u n n i n g   t h i s   s c r i p t .��  ��   � k   E� � �  � � � Z   E � � ��� � � I  E O�� ���
�� .coredoexbool        obj  � 4   E K�� �
�� 
cUsP � o   I J���� 20 destinationplaylistname destinationPlaylistName��   � Q   R l � ��� � I  U c�� ���
�� .coredelonull���    obj  � n   U _ � � � 2  [ _��
�� 
cTrk � 4   U [�� �
�� 
cUsP � o   Y Z���� 20 destinationplaylistname destinationPlaylistName��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��   � I  o ����� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   s v��
�� 
cUsP � �� ���
�� 
prdt � K   y � � � �� � �
�� 
pnam � o   | }���� 20 destinationplaylistname destinationPlaylistName � �� � �
�� 
pShf � m   � ���
�� boovfals � �� ���
�� 
pRpt � m   � ���
�� eSpKkSpN��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � $ these set some initial values.    � � � � < t h e s e   s e t   s o m e   i n i t i a l   v a l u e s . �  � � � r   � � � � � I  � �������
�� .misccurdldt    ��� null��  ��   � o      ���� 0 currenttime currentTime �  � � � r   � � � � � \   � � � � � o   � ����� 0 currenttime currentTime � l  � � ����� � ]   � � � � � o   � ����� 40 minimumdayssincelastplay minimumDaysSinceLastPlay � 1   � ���
�� 
days��  ��   � o      ���� 0 
targetdate 
targetDate �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � m   � � � � � � �   � o      ���� 0 thealbum theAlbum �  � � � r   � � � � � m   � � � � � � �   � o      ���� 0 	theartist 	theArtist �  � � � l  � ��� � ���   � � �these hold the names of already duplicated albums, and either the artist or placeholder text indicating it is a compilation. This is to try to prevent it excluding two albums with the same name, but it won't work great for compilations    � � � �� t h e s e   h o l d   t h e   n a m e s   o f   a l r e a d y   d u p l i c a t e d   a l b u m s ,   a n d   e i t h e r   t h e   a r t i s t   o r   p l a c e h o l d e r   t e x t   i n d i c a t i n g   i t   i s   a   c o m p i l a t i o n .   T h i s   i s   t o   t r y   t o   p r e v e n t   i t   e x c l u d i n g   t w o   a l b u m s   w i t h   t h e   s a m e   n a m e ,   b u t   i t   w o n ' t   w o r k   g r e a t   f o r   c o m p i l a t i o n s �  � � � r   � � � � � c   � � � � � J   � �����   � m   � ���
�� 
list � o      ���� $0 duplicatedalbums duplicatedAlbums �  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � V   �� � � � k   �� � �  � � � l  � ���������  ��  ��   �  � � � r   �
 � � � 6  � � � � n   � � � � � 3   � ���
�� 
cTrk � o   � �����  0 sourceplaylist sourcePlaylist � F   � � � � F   � � � � � =  � � � � � 1   � ���
�� 
enbl � m   � ���
�� boovtrue � =  � � � � � 1   � ��
� 
pTPc � m   � ��~
�~ boovfals � E   � � � � 1   � ��}
�} 
pKnd � m   � � � � � � 
 a u d i o � o      �|�| 0 randomtrack randomTrack �  � � � l �{�z�y�{  �z  �y   �  �  � r   n   1  �x
�x 
pAlb o  �w�w 0 randomtrack randomTrack o      �v�v 0 thealbum theAlbum   r  " n  	
	 1  �u
�u 
pArt
 o  �t�t 0 randomtrack randomTrack o      �s�s 0 	theartist 	theArtist  l ##�r�q�p�r  �q  �p    l ##�o�o   S MSet the unique key to identify this album so we don't attempt to add it twice    � � S e t   t h e   u n i q u e   k e y   t o   i d e n t i f y   t h i s   a l b u m   s o   w e   d o n ' t   a t t e m p t   t o   a d d   i t   t w i c e  Z  #H�n l #,�m�l = #, n  #* 1  &*�k
�k 
pAnt o  #&�j�j 0 randomtrack randomTrack m  *+�i
�i boovfals�m  �l   r  /: b  /6 o  /2�h�h 0 thealbum theAlbum o  25�g�g 0 	theartist 	theArtist o      �f�f 0 listkey listKey�n   r  =H !  b  =D"#" o  =@�e�e 0 thealbum theAlbum# m  @C$$ �%%  C o m p i l a t i o n! o      �d�d 0 listkey listKey &'& l II�c�b�a�c  �b  �a  ' ()( l II�`*+�`  * b \Only want to consider an album if the random song we picked is old or has never been played.   + �,, � O n l y   w a n t   t o   c o n s i d e r   a n   a l b u m   i f   t h e   r a n d o m   s o n g   w e   p i c k e d   i s   o l d   o r   h a s   n e v e r   b e e n   p l a y e d .) -.- Z  I�/0�_1/ ? IR232 n  IP454 1  LP�^
�^ 
pPlC5 o  IL�]�] 0 randomtrack randomTrack3 m  PQ�\�\  0 k  Ux66 787 l UU�[�Z�Y�[  �Z  �Y  8 9:9 r  U`;<; n  U\=>= 1  X\�X
�X 
pPlD> o  UX�W�W 0 randomtrack randomTrack< o      �V�V 0 
playeddate 
playedDate: ?@? l aa�U�T�S�U  �T  �S  @ A�RA Z  axBC�QDB A ahEFE o  ad�P�P 0 
playeddate 
playedDateF o  dg�O�O 0 
targetdate 
targetDateC r  kpGHG m  kl�N
�N boovtrueH o      �M�M 0 oldsong oldSong�Q  D r  sxIJI m  st�L
�L boovfalsJ o      �K�K 0 oldsong oldSong�R  �_  1 r  {�KLK m  {|�J
�J boovtrueL o      �I�I 0 oldsong oldSong. MNM l ���H�G�F�H  �G  �F  N O�EO Z  ��PQ�D�CP = ��RSR o  ���B�B 0 oldsong oldSongS m  ���A
�A boovtrueQ k  ��TT UVU l ���@WX�@  W l fthe following determines whether or not at least half of the album has been played by the target date.   X �YY � t h e   f o l l o w i n g   d e t e r m i n e s   w h e t h e r   o r   n o t   a t   l e a s t   h a l f   o f   t h e   a l b u m   h a s   b e e n   p l a y e d   b y   t h e   t a r g e t   d a t e .V Z[Z l ���?\]�?  \ E ?Only do additional checks if this album has not been added yet.   ] �^^ ~ O n l y   d o   a d d i t i o n a l   c h e c k s   i f   t h i s   a l b u m   h a s   n o t   b e e n   a d d e d   y e t .[ _�>_ Z  ��`a�=�<` l ��b�;�:b H  ��cc E ��ded o  ���9�9 $0 duplicatedalbums duplicatedAlbumse o  ���8�8 0 listkey listKey�;  �:  a k  ��ff ghg r  ��iji m  ���7�7  j o      �6�6 0 oldcount oldCounth klk r  ��mnm m  ���5�5  n o      �4�4 0 	albumsize 	albumSizel opo l ���3�2�1�3  �2  �1  p qrq Z  ��st�0us = ��vwv n  ��xyx 1  ���/
�/ 
pAnty o  ���.�. 0 randomtrack randomTrackw m  ���-
�- boovtruet k  ��zz {|{ l ���,}~�,  } � z Only match compilations with the same album name. There are cases that this could return alot more tracks than it should.   ~ � �   O n l y   m a t c h   c o m p i l a t i o n s   w i t h   t h e   s a m e   a l b u m   n a m e .   T h e r e   a r e   c a s e s   t h a t   t h i s   c o u l d   r e t u r n   a l o t   m o r e   t r a c k s   t h a n   i t   s h o u l d .| ��+� r  ����� l ����*�)� 6 ����� n  ����� 2  ���(
�( 
cTrk� o  ���'�'  0 sourceplaylist sourcePlaylist� l ����&�%� F  ����� = ����� 1  ���$
�$ 
pAlb� o  ���#�# 0 thealbum theAlbum� = ����� 1  ���"
�" 
pAnt� m  ���!
�! boovtrue�&  �%  �*  �)  � o      � �  0 songlist songList�+  �0  u k  ���� ��� l ������  � 4 . Only get songs where the album & artist match   � ��� \   O n l y   g e t   s o n g s   w h e r e   t h e   a l b u m   &   a r t i s t   m a t c h� ��� r  ����� l ������ 6 ����� n  ����� 2  ���
� 
cTrk� o  ����  0 sourceplaylist sourcePlaylist� l ������ F  ����� = ����� 1  ���
� 
pAlb� o  ���� 0 thealbum theAlbum� = ����� 1  ���
� 
pArt� o  ���� 0 	theartist 	theArtist�  �  �  �  � o      �� 0 songlist songList�  r ��� l ������  �  �  � ��� l ������  � Y SLook through each song in the album to work out the number of old songs that exist    � ��� � L o o k   t h r o u g h   e a c h   s o n g   i n   t h e   a l b u m   t o   w o r k   o u t   t h e   n u m b e r   o f   o l d   s o n g s   t h a t   e x i s t  � ��� X  �`���� k  [�� ��� r  ��� [  ��� o  �� 0 	albumsize 	albumSize� m  �� � o      �� 0 	albumsize 	albumSize� ��� r  #��� l ��
�	� n  ��� 1  �
� 
pPlD� o  �� 0 eachsong eachSong�
  �	  � o      �� 0 
playeddate 
playedDate� ��� r  $-��� l $)���� n  $)��� 1  %)�
� 
pPlC� o  $%�� 0 eachsong eachSong�  �  � o      �� 0 playedcount playedCount� ��� Z  .E��� ��� B .5��� o  .1���� 0 
playeddate 
playedDate� o  14���� 0 
targetdate 
targetDate� r  8A��� [  8=��� o  8;���� 0 oldcount oldCount� m  ;<���� � o      ���� 0 oldcount oldCount�   ��  � ���� Z  F[������� = FK��� o  FI���� 0 playedcount playedCount� m  IJ����  � r  NW��� [  NS��� o  NQ���� 0 oldcount oldCount� m  QR���� � o      ���� 0 oldcount oldCount��  ��  ��  � 0 eachsong eachSong� o  � ���� 0 songlist songList� ��� l aa��������  ��  ��  � ��� l aa������  � < 6If enough songs are old, add the album to the playlist   � ��� l I f   e n o u g h   s o n g s   a r e   o l d ,   a d d   t h e   a l b u m   t o   t h e   p l a y l i s t� ���� Z  a�������� @ al��� l aj������ _  aj��� l af������ ^  af��� o  ad���� 0 oldcount oldCount� o  de���� ,0 minimumoldpercentage minimumOldPercentage��  ��  � o  fi���� 0 	albumsize 	albumSize��  ��  � m  jk���� � k  o��� ��� r  oz��� b  ov��� o  or���� $0 duplicatedalbums duplicatedAlbums� o  ru���� 0 listkey listKey� o      ���� $0 duplicatedalbums duplicatedAlbums� ���� Q  {����� X  ~������ I ������
�� .coreclon****      � ****� o  ������ 0 eachsong eachSong� �����
�� 
insh� 4  �����
�� 
cUsP� o  ������ 20 destinationplaylistname destinationPlaylistName��  �� 0 eachsong eachSong� o  ������ 0 songlist songList� R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmesg  � �����
�� 
errn� o      ���� 0 errn  ��  � I �������
�� .sysodlogaskr        TEXT� b  ����� b  ��   b  �� b  �� o  ������ 0 errmesg   o  ����
�� 
ret  o  ����
�� 
ret  m  �� �  e r r o r   n u m b e r :  � l 	������ l ��	����	 c  ��

 o  ������ 0 errn   m  ����
�� 
ctxt��  ��  ��  ��  ��  ��  ��  ��  ��  �=  �<  �>  �D  �C  �E   � A  � � l  � ����� l  � ����� I  � �����
�� .corecnte****       **** n   � � 2   � ���
�� 
cTrk 4   � ���
�� 
cUsP o   � ����� 20 destinationplaylistname destinationPlaylistName��  ��  ��  ��  ��   o   � ����� &0 minimumtrackcount minimumTrackCount � �� l ����������  ��  ��  ��  ��   # m     �                                                                                  hook  alis    N  Macintosh HD               �NH+   y�
iTunes.app                                                      |S��z        ����  	                Applications    �N      �k�     y�  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��  ��       ����   ��
�� .aevtoappnull  �   � **** ��������
�� .aevtoappnull  �   � **** k    �   ����  ��  ��   �������� 0 eachsong eachSong�� 0 errmesg  �� 0 errn   H�������� [������ r���������� � � ����������������������������������������� ��� ��������������� �����������$����~�}�|�{�z�y�x�w�v�u�t�s
�� 
cLiP��  0 sourceplaylist sourcePlaylist�� �� 40 minimumdayssincelastplay minimumDaysSinceLastPlay�� ,0 minimumoldpercentage minimumOldPercentage�� 2�� &0 minimumtrackcount minimumTrackCount�� 20 destinationplaylistname destinationPlaylistName
�� 
pPlS
�� ePlSkPSS
�� 
pPla�� "0 currentplaylist currentPlaylist
�� .sysodlogaskr        TEXT
�� 
cUsP
�� .coredoexbool        obj 
�� 
cTrk
�� .coredelonull���    obj ��  ��  
�� 
kocl
�� 
prdt
�� 
pnam
�� 
pShf
�� 
pRpt
�� eSpKkSpN�� �� 
�� .corecrel****      � null
�� .misccurdldt    ��� null�� 0 currenttime currentTime
�� 
days�� 0 
targetdate 
targetDate�� 0 thealbum theAlbum�� 0 	theartist 	theArtist
�� 
list�� $0 duplicatedalbums duplicatedAlbums
�� .corecnte****       ****  
�� 
enbl
�� 
pTPc
�� 
pKnd�� 0 randomtrack randomTrack
�� 
pAlb
�� 
pArt
�� 
pAnt�� 0 listkey listKey
�� 
pPlC
� 
pPlD�~ 0 
playeddate 
playedDate�} 0 oldsong oldSong�| 0 oldcount oldCount�{ 0 	albumsize 	albumSize�z 0 songlist songList
�y 
cobj�x 0 playedcount playedCount
�w 
insh
�v .coreclon****      � ****�u 0 errmesg   �r�q�p
�r 
errn�q 0 errn  �p  
�t 
ret 
�s 
ctxt�����*�k/E�O�E�O�E�O�E�O�E�O*�,� 
*�,E�Y �E�O��  a �%a %j Y�*a �/j   *a �/a -j W X  hY $*a a a a �a fa a a a   !O*j "E` #O_ #�_ $ E` %Oa &E` 'Oa (E` )Ojva *&E` +Oh*a �/a -j ,��a .a -[[[a .,\Ze8\[a /,\Zf8A\[a 0,\Za 1@A1E` 2O_ 2a 3,E` 'O_ 2a 4,E` )O_ 2a 5,f  _ '_ )%E` 6Y _ 'a 7%E` 6O_ 2a 8,j (_ 2a 9,E` :O_ :_ % 
eE` ;Y fE` ;Y eE` ;O_ ;e J_ +_ 6;jE` <OjE` =O_ 2a 5,e  )�a -a -[[a 3,\Z_ '8\[a 5,\Ze8A1E` >Y (�a -a -[[a 3,\Z_ '8\[a 4,\Z_ )8A1E` >O e_ >[a a ?l ,kh  _ =kE` =O�a 9,E` :O�a 8,E` @O_ :_ % _ <kE` <Y hO_ @j  _ <kE` <Y h[OY��O_ <�!_ ="k \_ +_ 6%E` +O . (_ >[a a ?l ,kh  �a A*a �/l B[OY��W X C D�_ E%_ E%a F%�a G&%j Y hY hY h[OY��OPU ascr  ��ޭ