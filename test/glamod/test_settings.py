from glamod.settings import get


def test_settings():
    assert(get('r2.0:full:land:incoming:source_configuration') == \
           '/gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/source_configuration')
    assert(get('r2.0:full:land:incoming:source_configuration') == \
           get(':full:land::source_configuration'))




