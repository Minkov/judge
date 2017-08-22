from .base_executor import ScriptExecutor


class NodeExecutor(ScriptExecutor):
    ext = '.js'
    address_grace = 131079
    name = 'NODE'
    command = 'node'
    test_program = '''
        const readline = require('/libs/node_modules/readline-sync/lib/readline-sync.js');
        console.log(readline.question());
    '''

    def get_cmdline(self):
        return ['node', self._code]
