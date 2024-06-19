using Microsoft.Win32;
using System;
using System.Threading.Tasks;

namespace Task10.ViewModels.Commands
{
    internal class SavePhotoCommand : BaseCommand
    {
        private GaussianBlurViewModel _gaussianBlurViewModel;

        public SavePhotoCommand(GaussianBlurViewModel gaussianBlurViewModel)
        {
            _gaussianBlurViewModel = gaussianBlurViewModel;
        }

        public async override void Execute(object? parameter)
        {
            try
            {
                SaveFileDialog saveDialog = new();
                saveDialog.CheckPathExists = true;
                saveDialog.Filter = "MP4|*.mp4;|AVI|*.AVI";

                if (saveDialog.ShowDialog() == false)
                    return;

                await Task.Run(() =>
                {
                    _gaussianBlurViewModel.Wrapper.save_rendered(saveDialog.FileName);
                });
            }
            catch (Exception)
            {
            }
        }
    }
}
