#include "pch.h"
#include "Wrapper.h"
#include <string>
#include <iostream>

namespace Wrappers {
	Wrapper::Wrapper()
		: ManagedObject(new core_api::Blurer()) {}

	void Wrapper::init() {
		m_Instance->init("frozen_inference_graph.pb", "frozen_inference.pbtxt", "C:\\Program Files\\Tesseract-OCR\\tessdata");
	}

	void Wrapper::set_image(String^ str) {
		m_Instance->load(string_to_char_array(str));
	}

	void Wrapper::start_render() {
		m_Instance->start_render();
	}

	void Wrapper::save_rendered(String^ str) {
		m_Instance->save_rendered(string_to_char_array(str));
	}

	void Wrapper::create_stream(int frame) {
		m_Instance->create_stream(frame);
	}

	float Wrapper::rendering_progress() {
		return m_Instance->rendering_progress();
	}
	
	bool Wrapper::done_rendering() {
		return m_Instance->done_rendering();
	}
	
	array<Byte>^ Wrapper::buffer() {
		auto imgData = m_Instance->stream_buffer_preview();
		if (imgData.data == nullptr)
		{
			return nullptr;
		}
		rows = imgData.height;
		cols = imgData.width;
		int len = (imgData.width - 1) * imgData.height * 3 + (imgData.height - 1) * 3 + (3 - 1);
		auto n = imgData.data;
		
		array< Byte >^ byteArray = gcnew array< Byte >(len + 1);
		
		for (size_t i = 0; i < len; i += 3)
		{
			byteArray[i] = n[i + 2]; //bgr | rgb
			byteArray[i + 1] = n[i + 1];
			byteArray[i + 2] = n[i];
		}
		return byteArray;
	}
}