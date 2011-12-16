# ref: http://marc.info/?l=apache-modperl&m=111445150218566&w=2

package Heroku::IndexFixup;

use strict;
use warnings FATAL => qw(all);

use Apache2::Const -compile => qw(DIR_MAGIC_TYPE OK DECLINED);
use Apache2::RequestRec;
require Apache2::RequestUtil;

sub handler {

  my $r = shift;

  if ($r->handler eq 'perl-script' &&
      -d $r->filename              &&
      $r->is_initial_req)
  {
    $r->handler(Apache2::Const::DIR_MAGIC_TYPE);

    return Apache2::Const::OK;
  }

  return Apache2::Const::DECLINED;
}

1;
