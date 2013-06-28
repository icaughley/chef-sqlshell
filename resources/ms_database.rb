#
# Copyright Peter Donald
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

=begin
#<
Manage databases in in SQL Server.

@action create Create the database.
@action drop Drop the database.

@section Examples

    # Create a database
    sqlshell_ms_database "ResourceDB" do
      jdbc_url "jdbc:jtds:sqlserver://127.0.0.1:5432/mydb"
      jdbc_driver 'net.sourceforge.jtds.jdbc.Driver'
      extra_classpath ['http://repo1.maven.org/maven2/net/sourceforge/jtds/jtds/1.2.7/jtds-1.2.7.jar']
      jdbc_properties 'user' => 'sa', 'password' => 'secret'

      recovery_model "SIMPLE"
      collation 'SQL_Latin1_General_CP1_CS_AS'
    end
#>
=end

actions :create, :drop

#<> @attribute database The database to create/drop.
attribute :database, :kind_of => String, :name_attribute => true
#<> @attribute recovery_model The recovery model of the database.
attribute :recovery_model, :equal_to => ['SIMPLE','FULL'], :default => 'SIMPLE'
#<> @attribute collation The collation of the database.
attribute :collation, :kind_of => [String], :default => 'SQL_Latin1_General_CP1_CS_AS'

#<> @attribute jdbc_url The jdbc connection url.
attribute :jdbc_url, :kind_of => String, :required => true
#<> @attribute jdbc_driver The class name of the jdbc driver.
attribute :jdbc_driver, :kind_of => String, :required => true
#<> @attribute extra_classpath An array of urls to jars to add to the classpath.
attribute :extra_classpath, :kind_of => Array, :required => true
#<> @attribute jdbc_properties A collection of jdbc connection properties.
attribute :jdbc_properties, :kind_of => Hash, :default => {}

default_action :create
