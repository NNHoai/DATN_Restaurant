from django import template

register = template.Library()

# @register.simple_tag
def increment(value):
    value += 1
    return value

register.filter('increment', increment)