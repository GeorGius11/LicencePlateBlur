#pragma once
#include "../final_core/src/Blurer.h"
#include "ManagedObject.h"

using namespace System::Threading;
using namespace System;

namespace Wrappers {
    public ref class Wrapper : public ManagedObject<core_api::Blurer> {
    public:
        Wrapper();
        
        int rows;
        int cols;

        bool done_rendering();
        float rendering_progress();
        array<Byte>^ buffer();
        
        void init();
        void set_image(String^ str);
        void start_render();
        void save_rendered(String^ str);
        void create_stream(int frame);
    };
}
