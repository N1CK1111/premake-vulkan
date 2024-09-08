#pragma once

#include "vk_types.h"
#include <vector>
#include <iostream>

class PipelineBuilder {
    public:
        std::vector<VkPipelineShaderStageCreateInfo> _shaderStages;
	    VkPipelineVertexInputStateCreateInfo _vertexInputInfo;
	    VkPipelineInputAssemblyStateCreateInfo _inputAssembly;
	    VkViewport _viewport;
	    VkRect2D _scissor;
	    VkPipelineRasterizationStateCreateInfo _rasterizer;
	    VkPipelineColorBlendAttachmentState _colorBlendAttachment;
	    VkPipelineMultisampleStateCreateInfo _multisampling;
	    VkPipelineLayout _pipelineLayout;

	    VkPipeline build_pipeline(VkDevice device, VkRenderPass pass);
};

namespace vkutil {
    
    VkPipeline PipelineBuilder::build_pipeline(VkDevice device, VkRenderPass pass) {
        //make viewport state from our stored viewport and scissor.
		//at the moment we won't support multiple viewports or scissors
		VkPipelineViewportStateCreateInfo viewportState = {};
		viewportState.sType = VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
		viewportState.pNext = nullptr;

		viewportState.viewportCount = 1;
		viewportState.pViewports = &_viewport;
		viewportState.scissorCount = 1;
		viewportState.pScissors = &_scissor;

		//setup dummy color blending. We aren't using transparent objects yet
		//the blending is just "no blend", but we do write to the color attachment
		VkPipelineColorBlendStateCreateInfo colorBlending = {};
		colorBlending.sType = VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
		colorBlending.pNext = nullptr;

		colorBlending.logicOpEnable = VK_FALSE;
		colorBlending.logicOp = VK_LOGIC_OP_COPY;
		colorBlending.attachmentCount = 1;
		colorBlending.pAttachments = &_colorBlendAttachment;
    }
}