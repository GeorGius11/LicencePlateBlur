   M S B A M L   `   `   `  ���� W  SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   Gradient_Rainbow  �� Opacity �� 
StartPoint �� EndPoint � Offset � Color  SliderThumb �� 
TargetType �� Property �� Value �� 
TargetType	 �� RelativeSource
 �� AncestorType J� Effect3    -System.Windows.Media.Effects.DropShadowEffect    
BlurRadius    Opacity    ShadowDepth    Color'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState   
Storyboard �� 
TargetName �� TargetProperty	 W� To g� Duration W� EasingFunction.   (System.Windows.Media.Animation.PowerEase7   1System.Windows.Media.Animation.EasingFunctionBase   
EasingMode	 �� To �� EasingFunction.   (System.Windows.Media.Animation.CubicEase 
 Slider � RowDefinitions ]�Name ]� Thumb  Horizontal_Slider �� Triggers P� Property  P� Value�� F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml      %�  &	        &	 }     &	 �    7  &	 �    7  �� $	  0.8Q�$	 0,0&�$	 1,1&�.��� $	 0.0Q�$ #D3D3D3��� $	 0.5Q�$ #BDBDBD��� $	 1.0Q�$ #9E9E9E���� " n�.���  �@J�SnapsToDevicePixels$
 true����  �@�OverridesDefaultStyle$
 true����  � �� �� " n�.R�� .+��� $��	TextBlock��$��5,0,0,70q�$��Center=�$��18(�
������ ���� *Value+	 �� "
 ���� $��Ellipse��$��5,0,0,0q�$��10��$��40��
�������$��Center=�    EllipseShadow��$ 0Q�$	 0.7Q�$ 0Q�$ Black��   CommonState��.   
Normal��. �� .��W� $ EllipseShadow��$ 
BlurRadius� 0$ 0:0:1D�   $ EaseOut=��� $ Ellipse��$" Fill.(SolidColorBrush.Color)� 	LightGray$ 0:0:.15D�   $ EaseOut=��� $ 	TextBlock��$( "Foreground.(SolidColorBrush.Color)� Transparent$ 0:0:.15D�   $ 	EaseInOut=�  Pressed��. �� .��W� $ EllipseShadow��$ 
BlurRadius� 20$ 0:0:0.2D�   $ 	EaseInOut=��� $ Ellipse��$" Fill.(SolidColorBrush.Color)� DarkGray$ 0:0:.1D�   $ 	EaseInOut=��� $ 	TextBlock��$( "Foreground.(SolidColorBrush.Color)�	 White$ 0:0:.15D�   $ 	EaseInOut=�  	MouseOver��. �� .��W� $ EllipseShadow��$ 
BlurRadius� 0$ 0:0:0.2D�   $ 	EaseInOut=��� $ Ellipse��$" Fill.(SolidColorBrush.Color)�	 White$ 0:0:.15D�   $ 	EaseInOut=��� $ 	TextBlock��$( "Foreground.(SolidColorBrush.Color)�	 White$ 0:0:.15D�   $ 	EaseInOut=��� " ��.R��  �� $
��Auto ��� $
��Auto �#��z���� $
��Auto �.+�]� $ 
PART_Track��$��1�� n� 8��      $ 15Q�$ 1Q�$ Black���� " ��.���  � |�$ False����  �@J�SnapsToDevicePixels$
 true����  �@�OverridesDefaultStyle$
 true�� P�  �@��Orientation$  
Horizontal=�. ���  � ��$ 21����  � ��$	 104����  � ��8   