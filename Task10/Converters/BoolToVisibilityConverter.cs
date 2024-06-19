using System;
using System.Windows;
using System.Windows.Data;

namespace Task10.Converters
{
    [ValueConversion(typeof(bool), typeof(Visibility))]
    public class BoolToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            bool? boolValue = value as bool?;

            if (boolValue == true || boolValue == null)
                return Visibility.Visible;
            else
                return Visibility.Collapsed;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            Visibility? visibility = value as Visibility?;

            if (visibility == Visibility.Visible)
                return true;
            else
                return false;
        }
    }

}
