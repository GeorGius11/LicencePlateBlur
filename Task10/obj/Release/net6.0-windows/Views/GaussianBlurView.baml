   M S B A M L   `   `   `  ���� 
  Task10#    Task10.Views.GaussianBlurView   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Z VFontAwesome.WPF, Version=4.7.0.37774, Culture=neutral, PublicKeyToken=0758b07a11a4f466-ia$http://schemas.fontawesome.io/icons/  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  .���   � RowDefinitions  �� $
��auto ��� $��* ��� $
��0.2* �.+��� $��0��$��3��$��/Assets/Blurred_photo.png��$
��Fill=�� $��0��$��3��.+��� $	��-50q�$
��Fill=����� *	ImagePath+ J� Effect -  'System.Windows.Media.Effects.BlurEffect     
KernelType$ Gaussian=�   Radius$ 50Q��� 
���   � J� Opacity$	 0.5Q��� $��0��$��0,20,0,0q�$��Center=� �� Orientation$ 
Horizontal=�.+��� $��5q�$��15(�
�������   TransparentButton#��[  ���� *OpenPhotoCommand+.���� $ 
Horizontal=�.+�� .+�F� $��0,0,5,5q��������!@T� ���� @T� ���� �ا ���!�ا ���! -1�@KL  -1�@KL �ا �@T� �ا �@T� @T� �@KL @T� ��V-@@T� ��- (� ��- �ا ���-  -1���- �B�V-@��O@KL ��O���!��O�X�2��O@o@�B@o@ -1�@o@�ا �@o@(� X�2@T� ��!@T� 	
�������F� $��0,0,5,5q�F���� � ��� $� @]� �@]� @]� �@]� �� ��ا �� ��ا @]� � z @]� 	
��������� $��Center=�$��15(�$��Import Video���� $��15,5,5,5q�$��15(�
�������#��[  ���� *SavePhotoCommand+.���� $ 
Horizontal=�.+�� .+�F� $��0,0,5,5q������@KL ��O���!��O�X�2��O@o@�B@o@ -1�@o@�ا �@o@(� X�2@T� ��!@T� ���� @T� ���� �ا ���!�ا ���! -1�@KL  -1�@KL �ا �@T� �ا �@T� @T� �@KL @T� ��V-@@T� ��- (� ��- �ا ���-  -1���- �B�V-@��O@KL ��O	
�������F� $��0,0,5,5q�F�����ا  $� �@]�  $� �@]� ��j � $� ��j � � �� � z ��j ��ا ��j 	
��������� $��Center=�$��
Save Video��"  FontAwesome.WPF.ImageAwesome  $��1��$��40��$��40��$��Center=�$��Center=�  Gradient_Rainbow   
Foreground# [    Icon$ Spinner=�   Spin �� *IsImageProcessing+y��� *IsImageProcessing+  BoolToVisibilityConv	 �� 	Converter#	 [ �� -   
 ��Name$
 ProcessingImage��$��1������ *	ImagePath+y��� *IsFrameVisible+#	 [  J� OpacityMask !�  !� Visual �� 
������� �� CornerRadius$ 10������  �� ElementName$ ProcessingImage�� �� Path$ ActualWidth����� $ ProcessingImage��$ ActualHeight� 3  -System.Windows.Media.Effects.DropShadowEffect     
BlurRadius$ 50Q�   ShadowDepth$ 0Q�   Color$ Black��  $��1��$��40��$��40��$��Center=�$��Center=�# [ $ Spinner=� �� *IsImageProcessing+y��� *IsImageProcessing+#	 [ � $��2��$��Center=�  �� $
��auto ��� $
��auto �.+��� $��1��$��Center=����� *PreviewSources+   $ 50Q�$ 0Q�$ Black������ .R��� $ 
Horizontal=����� .R��� $��80��$��40��
���   �$��1q�._��� $
��Fill=����� �� -    ��Name$ 
BlurSlider��$��1��$	��800��$��Center=� �� IsSnapToTickEnabled$
 True��  Horizontal_Slider#��[  �� TickFrequency$ 1Q� � Maximum �� *SliderLength+y��� *IsSliderVisible+#	 [  � Value �� *CurrentFrame+� $��2��$��0,0,5,5q�$��Right=�$��Bottom=�  �� $
��auto ��� $
��auto �.+��� $��0��$��0,0,0,5q�$��Center=�$��15(�
����������� *RenderProgress+y��� *IsSliderVisible+#	 [ � $��1��$	��100��$��10��y��� *IsSliderVisible+#	 [  �� *RenderValue+