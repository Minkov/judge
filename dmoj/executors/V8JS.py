from .base_executor import ScriptExecutor


class Executor(ScriptExecutor):
    ext = '.js'
    name = 'V8JS'
    command = 'v8dmoj'
    test_program = 'print(gets());'
    address_grace = 786432

    def __init__(self, problem_id, source_code, **kwargs):
	source_code = source_code + ';quit(0);'
	print(source_code)
        super(Executor, self).__init__(problem_id, source_code, **kwargs)
