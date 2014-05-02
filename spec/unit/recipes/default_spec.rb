#
# Cookbook Name:: graphite
#
# Copyright 2014, Rackspace, UK, Ltd.
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

require 'spec_helper'

describe 'rackspace_graphite::default' do
  graphite_test_platforms.each do |platform, versions|
    describe "on #{platform}" do
      versions.each do |version|
        describe version do
          before :each do
          end
          let(:chef_run) do
            runner = ChefSpec::Runner.new(platform: platform.to_s, version: version.to_s)
            runner.converge('rackspace_graphite::default')
          end
          it 'include the apache2 recipe' do
            expect(chef_run).to include_recipe 'apache2'
          end
          it 'include the user recipe' do
            expect(chef_run).to include_recipe 'rackspace_graphite::user'
          end
        end
      end
    end
  end
end
