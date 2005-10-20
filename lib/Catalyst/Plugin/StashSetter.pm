package Catalyst::Plugin::StashSetter;
use strict;
use warnings;

our $VERSION = '0.03';

sub set_stash {
    my $c = shift;
    while ( my ( $key, $val ) = splice @_, 0, 2 ) {
        $c->stash->{$key} = $val;
    }
}

1;
__END__

=head1 NAME

Catalyst::Plugin::StashSetter - stash setter for Catalyst

=head1 SYNOPSIS

    package MyApp;
    use Catalyst qw/StashSetter/;
    
    package MyApp::C::MyController;

    sub my_action : Local {
        my ( $self, $c ) = @_;
        ...

        $c->set_stash(
            template => 'my_action.html',
            param1   => 'hoge',
            param2   => 'foo',
            param3   => 'bar',
        );
    }

=head1 DESCRIPTION

This module provides context with stash-setter.

    $c->set_stash( param => 'value' );

    # you can also set multiple parameters at a time.
    $c->set_stash(
        param1 => 'value1',
        param2 => 'value2',
        param3 => 'value3',
    );

This is but a synonym of follows.

    $c->stash->{param1} = 'value1';
    $c->stash->{param2} = 'value2';
    $c->stash->{param3} = 'value3';

Repeating "$c->stash->" many times isn't DRY.

=head1 SEE ALSO

L<Catalyst>

=head1 AUTHOR

Lyo Kato, E<lt>lyo.kato@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Lyo Kato

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

