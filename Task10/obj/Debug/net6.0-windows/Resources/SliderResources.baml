   M S B A M L   `   `   `  ����W  SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   Gradient_Rainbow  �� Opacity �� 
StartPoint �� EndPoint � Offset � Color  SliderThumb �� 
TargetType �� Property �� Value �� 
TargetType	 �� RelativeSource
 �� AncestorType J� Effect3    -System.Windows.Media.Effects.DropShadowEffect    
BlurRadius    Opacity    ShadowDepth    Color'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState   
Storyboard �� 
TargetName �� TargetProperty	 W� To g� Duration W� EasingFunction.   (System.Windows.Media.Animation.PowerEase7   1System.Windows.Media.Animation.EasingFunctionBase   
EasingMode	 �� To �� EasingFunction.   (System.Windows.Media.Animation.CubicEase 
 Slider � RowDefinitions ]�Name ]� Thumb  Horizontal_Slider �� Triggers P� Property  P� Value�� 5      F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml      6W   %�  &	        &	 �     &	 �
    7  &	     7  �� 5      $	  0.8Q�63   $	 0,0&�6A   $	 1,1&�6R   .��5   
   � $	 0.0Q�6   $ #D3D3D3��6$   � 5   
   $	 0.5Q�6   $ #BDBDBD��6$   � 5   
   $	 1.0Q�6   $ #9E9E9E��6$   5      �� 5	      " n�6    .�5
   
   ��  �@J�SnapsToDevicePixels$
 true��60   �� 5   
    �@�OverridesDefaultStyle$
 true��62   �� 5   
    � �� 5      �� 5      " n�6"   .R�5      � .+�5      �� $��	TextBlock��5      $��5,0,0,70q�5      $��Center=�5      $��18(�5      
������ ��5      �� *Value+	 �� "
 ���� 5      $��Ellipse��5      $��5,0,0,0q�5      $��10��5      $��40��5      
�������$��Center=�5       5         5   "   EllipseShadow��$ 0Q�5!   %   $	 0.7Q�5"   %   $ 0Q�5#   %   $ Black��5$   %   5&       5'        5(      CommonState��. 5)   "     
Normal��. 5*   &   �� .��5+   *   W� $ EllipseShadow��5,   -   $ 
BlurRadius�5-   -    05.   -   $ 0:0:1D�5/   -    50   .     51   2   $ EaseOut=�6<   53   +   �� 54   *   $ Ellipse��55   -   $" Fill.(SolidColorBrush.Color)�56   -    	LightGray57   -   $ 0:0:.15D�58   -    59   .     5:   2   $ EaseOut=�6<   5<   +   �� 5=   *   $ 	TextBlock��5>   -   $( "Foreground.(SolidColorBrush.Color)�5?   -    Transparent5@   -   $ 0:0:.15D�5A   -    5B   .     5C   2   $ 	EaseInOut=�6<   5E   +   5F   '   5G   #     5I   "   Pressed��. 5J   &   �� .��5K   *   W� $ EllipseShadow��5L   -   $ 
BlurRadius�5M   -    205N   -   $ 0:0:0.2D�5O   -    5P   .     5Q   2   $ 	EaseInOut=�6<   5S   +   �� 5T   *   $ Ellipse��5U   -   $" Fill.(SolidColorBrush.Color)�5V   -    DarkGray5W   -   $ 0:0:.1D�5X   -    5Y   .     5Z   2   $ 	EaseInOut=�6<   5\   +   �� 5]   *   $ 	TextBlock��5^   -   $( "Foreground.(SolidColorBrush.Color)�5_   -   	 White5`   -   $ 0:0:.15D�5a   -    5b   .     5c   2   $ 	EaseInOut=�6<   5e   +   5f   '   5g   #     5i   "   	MouseOver��. 5j   &   �� .��5k   *   W� $ EllipseShadow��5l   -   $ 
BlurRadius�5m   -    05n   -   $ 0:0:0.2D�5o   -    5p   .     5q   2   $ 	EaseInOut=�6<   5s   +   �� 5t   *   $ Ellipse��5u   -   $" Fill.(SolidColorBrush.Color)�5v   -   	 White5w   -   $ 0:0:.15D�5x   -    5y   .     5z   2   $ 	EaseInOut=�6<   5|   +   �� 5}   *   $ 	TextBlock��5~   -   $( "Foreground.(SolidColorBrush.Color)�5   -   	 White5�   -   $ 0:0:.15D�5�   -    5�   .     5�   2   $ 	EaseInOut=�6<   5�   +   5�   '   5�   #   5�      5�      5�      5�      5�      �� 5�      " ��6%   .R�5�   
   �  5�      �� 5�      $
��Auto �6    �� 5�      $
��Auto �6    #��z��6.   �� 5�      $
��Auto �6    .+�5�      ]� $ 
PART_Track��6   $��1��6(    5�      n� 5�      8��  6   5�       5�         5�      $ 15Q�5�      $ 1Q�5�      $ Black��5�      5�      5�      �� 5�      " ��6&   .�5�   
   ��  � |�$ False��6&   �� 5�   
    �@J�SnapsToDevicePixels$
 true��60   �� 5�   
    �@�OverridesDefaultStyle$
 true��62    5�   
   P� 5�       �@��Orientation$  
Horizontal=�6-   . �5�      ��  � ��$ 21��6.   �� 5�       � ��$	 104��6-   �� 5�       � ��8   6-   5�      5�      5�      