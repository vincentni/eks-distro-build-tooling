# Copyright Amazon.com Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -o pipefail
set -x

echo "Running uninstall.sh in $(pwd)"

KUBECTL_VERSION=v1.20.7
EKS_D_RELEASE_BRANCH=1-20
EKS_D_RELEASE_NUMBER=8
curl -sSL "https://distro.eks.amazonaws.com/kubernetes-${EKS_D_RELEASE_BRANCH}/releases/${EKS_D_RELEASE_NUMBER}/artifacts/kubernetes/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /bin/kubectl
chmod +x /bin/kubectl

kubectl delete mutatingwebhookconfiguration $MWC_NAME
kubectl delete secret -n $NAMESPACE $WEBHOOK_NAME
