#include website::deploy
class{'website::deploy':
  source => 'http://github.com/roylarsen/website.git',
}
