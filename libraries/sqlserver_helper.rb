#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class RealityForge #nodoc
  module SqlServer #nodoc
    class << self
      # Return the current sql server instance.
      #
      # The instance is typically set when configuration run starts
      #
      def get_current_instance(node)
        instance = node.run_state['sql_server_instance']
        raise 'No sql server instance specified' unless instance
        instance
      end

      # Set the current broker instance.
      #
      def set_current_instance(node, instance)
        node.run_state['sql_server_instance'] = instance
      end
    end
  end
end
