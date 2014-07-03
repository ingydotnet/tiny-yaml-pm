use strict; use warnings;
package Tiny::YAML::Constructor;
use Pegex::Base;
extends 'Pegex::Tree';

sub init {
    my ($self) = @_;
    $self->{data} = [];
    return;
}

sub final {
    my ($self) = @_;
    return @{$self->{data}};
}

sub got_block_mapping {
    my ($self, $got) = @_;
    return +{
        map {
            @$_
        } @{$got->[0]}
    };
}

sub got_yaml_document {
    my ($self, $got) = @_;
    push @{$self->{data}}, $got->[0][0];
    return;
}

1;
