#
# Copyright 2015-2016, Intel Corporation
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in
#       the documentation and/or other materials provided with the
#       distribution.
#
#     * Neither the name of the copyright holder nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
# pmempool_rm/TEST2 -- test for pmempool rm
#
[CmdletBinding(PositionalBinding=$false)]
Param(
    [alias("d")]
    $DIR = ""
    )
$Env:UNITTEST_NAME = "pmempool_rm\TEST3w"
$Env:UNITTEST_NUM = "3w"


. ..\unittest\unittest.ps1

require_test_type medium

require_fs_type any

setup

$LOG="out$Env:UNITTEST_NUM.log"

rm $LOG -Force -Recurse -ea si

#XXX: port poolsets tests
#
## Create poolset with replica
#create_poolset $DIR/pool.set 32M:$DIR/pool.part1:x 32M:$DIR/pool.part2:x\
#	R 32M:$DIR/rep.part1 32M:$DIR/rep.part2
#
## Check if pool set file exists
#check_files\
#	$DIR/pool.set
#
## Check if all pools don't exist
#check_no_files\
#	$DIR/pool.obj\
#	$DIR/pool.part1\
#	$DIR/pool.part2\
#	$DIR/rep.part1\
#	$DIR/rep.part2
#
## Try to remove files without force flag
#expect_abnormal_exit $PMEMPOOL$Env:EXESUFFIX rm -v $DIR/pool.obj >> $LOG 2>&1
#expect_abnormal_exit $PMEMPOOL$Env:EXESUFFIX rm -sv $DIR/pool.set >> $LOG 2>&1
## Try to remove files with force flag
#expect_normal_exit $PMEMPOOL$Env:EXESUFFIX rm -fv\
#	$DIR/pool.obj\
#	$DIR/pool.set >> $LOG 2>&1
#
#check_no_files\
#	$DIR/pool.set\
#	$DIR/pool.obj\
#	$DIR/pool.part1\
#	$DIR/pool.part2\
#	$DIR/rep.part1\
#	$DIR/rep.part2
#
#check
#
pass
