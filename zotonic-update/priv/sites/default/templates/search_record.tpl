{% for record in result %}
<li id="{{ record }}" onclick="GetSelectedValut('{{record}}')" value="test" class="suggestions-result clearfix">
{{record}}
</li>
{% empty %}
<li class="suggestions-result"><a href="javascript:void(0);">Nothing found.</a></li>
{% endfor %}
