## Licensed to Cloudera, Inc. under one
## or more contributor license agreements.  See the NOTICE file
## distributed with this work for additional information
## regarding copyright ownership.  Cloudera, Inc. licenses this file
## to you under the Apache License, Version 2.0 (the
## "License"); you may not use this file except in compliance
## with the License.  You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

<%!
from django.utils.translation import ugettext as _


def is_selected(section, matcher):
  if section == matcher:
    return "active"
  else:
    return ""
%>

<%def name="render_field(field, show_label=True, extra_attrs={})">
  % if not field.is_hidden:
    <% group_class = field.errors and "error" or "" %>
    <div class="control-group ${group_class}"
      rel="popover" data-original-title="${ field.label }" data-content="${ field.help_text }">
      % if show_label:
        <label class="control-label">${ field.label }</label>
      % endif
      <div class="controls">
        <% field.field.widget.attrs.update(extra_attrs) %>
        ${ field | n,unicode }
        % if field.errors:
          <span class="help-inline">${ field.errors | n,unicode }</span>
        % endif
      </div>
    </div>
  %endif
</%def>


<%def name="menubar(section='')">
  <link href="/security/static/css/security.css" rel="stylesheet">

  <link rel="stylesheet" href="/static/ext/select2/select2.css">
  <script src="/static/ext/select2/select2.min.js" type="text/javascript" charset="utf-8"></script>


  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <div class="nav-collapse">
            <ul class="nav">
              <li class="currentApp">
                <a href="/${app_name}">
                  <i class="fa fa-lock"></i>
                  ${ _('Hadoop Security') }
                </a>
              </li>
              <li class="${is_selected(section, 'hive')}"><a href="${ url('security:hive') }">${_('Databases and Tables')}</a></li>
              <li class="${is_selected(section, 'hdfs')}"><a href="${ url('security:hdfs') }">${_('Files and Directories')}</a></li>
            </ul>
          </div>
        </div>
      </div>
  </div>
</%def>
