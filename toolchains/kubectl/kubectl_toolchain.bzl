# Copyright 2018 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
This module implements the kubectl toolchain rule.
"""

KubectlInfo = provider(
    doc = "Information about how to invoke the kubectl tool.",
    fields = {
        "tool_path": "Path to the kubectl executable",
    },
)

def _kubectl_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        kubectlinfo = KubectlInfo(
            tool_path = ctx.attr.tool_path,
        ),
    )
    return [toolchain_info]

kubectl_toolchain = rule(
    implementation = _kubectl_toolchain_impl,
    attrs = {
        "tool_path": attr.string(),
    },
)
