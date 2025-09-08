# DO NOT EDIT
# This file was automatically generated using json-schema-to-nickel
let js2n = import ".js2n-lib/main.ncl" in
let rec refs
    = {
      oneOf."0" = { key | String, valueExpression | String },
      oneOf."1" = { fieldRef | String, warning | String },
      oneOf."10" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."101" =
        { audiences | Array String | optional, token | String | optional },
      oneOf."102" =
        {
            audiences | Array String | optional,
            authenticated | Bool | optional,
            error | String | optional,
            user | refs.oneOf."103" | { _ | Dyn } | optional
          },
      oneOf."103" =
        {
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            uid | String | optional,
            username | String | optional
          },
      oneOf."104" =
        {
            rawSelector | String | optional,
            requirements
              | Array (std.contract.Sequence [ refs.oneOf."680", { _ | Dyn } ])
              | optional
          },
      oneOf."105" =
        {
            rawSelector | String | optional,
            requirements
              | Array (std.contract.Sequence [ refs.oneOf."684", { _ | Dyn } ])
              | optional
          },
      oneOf."107" = { path | String | optional, verb | String | optional },
      oneOf."108" =
        { nonResourceURLs | Array String | optional, verbs | Array String },
      oneOf."109" =
        {
            fieldSelector | refs.oneOf."104" | { _ | Dyn } | optional,
            group | String | optional,
            labelSelector | refs.oneOf."105" | { _ | Dyn } | optional,
            name | String | optional,
            namespace | String | optional,
            resource | String | optional,
            subresource | String | optional,
            verb | String | optional,
            version | String | optional
          },
      oneOf."11" =
        {
            name | String,
            namespace | String,
            path | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."110" =
        {
            apiGroups | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            verbs | Array String
          },
      oneOf."112" =
        {
            nonResourceAttributes | refs.oneOf."107" | { _ | Dyn } | optional,
            resourceAttributes | refs.oneOf."109" | { _ | Dyn } | optional
          },
      oneOf."114" = { namespace | String | optional },
      oneOf."116" =
        {
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            nonResourceAttributes | refs.oneOf."107" | { _ | Dyn } | optional,
            resourceAttributes | refs.oneOf."109" | { _ | Dyn } | optional,
            uid | String | optional,
            user | String | optional
          },
      oneOf."117" =
        {
            allowed | Bool,
            denied | Bool | optional,
            evaluationError | String | optional,
            reason | String | optional
          },
      oneOf."118" =
        {
            evaluationError | String | optional,
            incomplete | Bool,
            nonResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."108", { _ | Dyn } ]),
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."110", { _ | Dyn } ])
          },
      oneOf."119" =
        { apiVersion | String | optional, kind | String, name | String },
      oneOf."12" =
        {
            expressionWarnings
              | Array (std.contract.Sequence [ refs.oneOf."1", { _ | Dyn } ])
              | optional
          },
      oneOf."120" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'HorizontalPodAutoscaler |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."122" | { _ | Dyn } | optional,
            status | refs.oneOf."123" | { _ | Dyn } | optional
          },
      oneOf."122" =
        {
            maxReplicas | std.number.Integer,
            minReplicas | std.number.Integer | optional,
            scaleTargetRef | refs.oneOf."119" | { _ | Dyn },
            targetCPUUtilizationPercentage | std.number.Integer | optional
          },
      oneOf."123" =
        {
            currentCPUUtilizationPercentage | std.number.Integer | optional,
            currentReplicas | std.number.Integer,
            desiredReplicas | std.number.Integer,
            lastScaleTime | refs.oneOf."696" | String | optional,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."125" = { replicas | std.number.Integer | optional },
      oneOf."126" =
        { replicas | std.number.Integer, selector | String | optional },
      oneOf."127" =
        {
            container | String,
            name | String,
            target | refs.oneOf."143" | { _ | Dyn }
          },
      oneOf."128" =
        {
            container | String,
            current | refs.oneOf."144" | { _ | Dyn },
            name | String
          },
      oneOf."129" =
        { apiVersion | String | optional, kind | String, name | String },
      oneOf."13" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."18" | { _ | Dyn } | optional,
            status | refs.oneOf."19" | { _ | Dyn } | optional
          },
      oneOf."130" =
        {
            metric | refs.oneOf."140" | { _ | Dyn },
            target | refs.oneOf."143" | { _ | Dyn }
          },
      oneOf."131" =
        {
            current | refs.oneOf."144" | { _ | Dyn },
            metric | refs.oneOf."140" | { _ | Dyn }
          },
      oneOf."132" =
        {
            periodSeconds | std.number.Integer,
            type | String,
            value | std.number.Integer
          },
      oneOf."133" =
        {
            policies
              | Array (std.contract.Sequence [ refs.oneOf."132", { _ | Dyn } ])
              | optional,
            selectPolicy | String | optional,
            stabilizationWindowSeconds | std.number.Integer | optional,
            tolerance | refs.oneOf."672" | optional
          },
      oneOf."134" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'HorizontalPodAutoscaler |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."138" | { _ | Dyn } | optional,
            status | refs.oneOf."139" | { _ | Dyn } | optional
          },
      oneOf."135" =
        {
            scaleDown | refs.oneOf."133" | { _ | Dyn } | optional,
            scaleUp | refs.oneOf."133" | { _ | Dyn } | optional
          },
      oneOf."136" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."138" =
        {
            behavior | refs.oneOf."135" | { _ | Dyn } | optional,
            maxReplicas | std.number.Integer,
            metrics
              | Array (std.contract.Sequence [ refs.oneOf."141", { _ | Dyn } ])
              | optional,
            minReplicas | std.number.Integer | optional,
            scaleTargetRef | refs.oneOf."129" | { _ | Dyn }
          },
      oneOf."139" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."136", { _ | Dyn } ])
              | optional,
            currentMetrics
              | Array (std.contract.Sequence [ refs.oneOf."142", { _ | Dyn } ])
              | optional,
            currentReplicas | std.number.Integer | optional,
            desiredReplicas | std.number.Integer,
            lastScaleTime | refs.oneOf."696" | String | optional,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."14" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."16" | { _ | Dyn } | optional
          },
      oneOf."140" =
        { name | String, selector | refs.oneOf."683" | { _ | Dyn } | optional },
      oneOf."141" =
        {
            containerResource | refs.oneOf."127" | { _ | Dyn } | optional,
            external | refs.oneOf."130" | { _ | Dyn } | optional,
            object | refs.oneOf."145" | { _ | Dyn } | optional,
            pods | refs.oneOf."147" | { _ | Dyn } | optional,
            resource | refs.oneOf."149" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."142" =
        {
            containerResource | refs.oneOf."128" | { _ | Dyn } | optional,
            external | refs.oneOf."131" | { _ | Dyn } | optional,
            object | refs.oneOf."146" | { _ | Dyn } | optional,
            pods | refs.oneOf."148" | { _ | Dyn } | optional,
            resource | refs.oneOf."150" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."143" =
        {
            averageUtilization | std.number.Integer | optional,
            averageValue | refs.oneOf."672" | optional,
            type | String,
            value | refs.oneOf."672" | optional
          },
      oneOf."144" =
        {
            averageUtilization | std.number.Integer | optional,
            averageValue | refs.oneOf."672" | optional,
            value | refs.oneOf."672" | optional
          },
      oneOf."145" =
        {
            describedObject | refs.oneOf."129" | { _ | Dyn },
            metric | refs.oneOf."140" | { _ | Dyn },
            target | refs.oneOf."143" | { _ | Dyn }
          },
      oneOf."146" =
        {
            current | refs.oneOf."144" | { _ | Dyn },
            describedObject | refs.oneOf."129" | { _ | Dyn },
            metric | refs.oneOf."140" | { _ | Dyn }
          },
      oneOf."147" =
        {
            metric | refs.oneOf."140" | { _ | Dyn },
            target | refs.oneOf."143" | { _ | Dyn }
          },
      oneOf."148" =
        {
            current | refs.oneOf."144" | { _ | Dyn },
            metric | refs.oneOf."140" | { _ | Dyn }
          },
      oneOf."149" = { name | String, target | refs.oneOf."143" | { _ | Dyn } },
      oneOf."150" = { current | refs.oneOf."144" | { _ | Dyn }, name | String },
      oneOf."151" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CronJob |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."153" | { _ | Dyn } | optional,
            status | refs.oneOf."154" | { _ | Dyn } | optional
          },
      oneOf."153" =
        {
            concurrencyPolicy | String | optional,
            failedJobsHistoryLimit | std.number.Integer | optional,
            jobTemplate | refs.oneOf."160" | { _ | Dyn },
            schedule | String,
            startingDeadlineSeconds | std.number.Integer | optional,
            successfulJobsHistoryLimit | std.number.Integer | optional,
            suspend | Bool | optional,
            timeZone | String | optional
          },
      oneOf."154" =
        {
            active
              | Array (std.contract.Sequence [ refs.oneOf."300", { _ | Dyn } ])
              | optional,
            lastScheduleTime | refs.oneOf."696" | String | optional,
            lastSuccessfulTime | refs.oneOf."696" | String | optional
          },
      oneOf."155" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Job |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."158" | { _ | Dyn } | optional,
            status | refs.oneOf."159" | { _ | Dyn } | optional
          },
      oneOf."156" =
        {
            lastProbeTime | refs.oneOf."696" | String | optional,
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."158" =
        {
            activeDeadlineSeconds | std.number.Integer | optional,
            backoffLimit | std.number.Integer | optional,
            backoffLimitPerIndex | std.number.Integer | optional,
            completionMode | String | optional,
            completions | std.number.Integer | optional,
            managedBy | String | optional,
            manualSelector | Bool | optional,
            maxFailedIndexes | std.number.Integer | optional,
            parallelism | std.number.Integer | optional,
            podFailurePolicy | refs.oneOf."161" | { _ | Dyn } | optional,
            podReplacementPolicy | String | optional,
            selector | refs.oneOf."683" | { _ | Dyn } | optional,
            successPolicy | refs.oneOf."165" | { _ | Dyn } | optional,
            suspend | Bool | optional,
            template | refs.oneOf."332" | { _ | Dyn },
            ttlSecondsAfterFinished | std.number.Integer | optional
          },
      oneOf."159" =
        {
            active | std.number.Integer | optional,
            completedIndexes | String | optional,
            completionTime | refs.oneOf."696" | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."156", { _ | Dyn } ])
              | optional,
            failed | std.number.Integer | optional,
            failedIndexes | String | optional,
            ready | std.number.Integer | optional,
            startTime | refs.oneOf."696" | String | optional,
            succeeded | std.number.Integer | optional,
            terminating | std.number.Integer | optional,
            uncountedTerminatedPods | refs.oneOf."167" | { _ | Dyn } | optional
          },
      oneOf."16" =
        {
            matchResources | refs.oneOf."3" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."9" | { _ | Dyn } | optional,
            policyName | String | optional,
            validationActions | Array String | optional
          },
      oneOf."160" =
        {
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."158" | { _ | Dyn } | optional
          },
      oneOf."161" =
        {
            rules
              | Array (std.contract.Sequence [ refs.oneOf."164", { _ | Dyn } ])
          },
      oneOf."162" =
        {
            containerName | String | optional,
            operator | String,
            values | Array std.number.Integer
          },
      oneOf."163" = { status | String, type | String },
      oneOf."164" =
        {
            action | String,
            onExitCodes | refs.oneOf."162" | { _ | Dyn } | optional,
            onPodConditions
              | Array (std.contract.Sequence [ refs.oneOf."163", { _ | Dyn } ])
              | optional
          },
      oneOf."165" =
        {
            rules
              | Array (std.contract.Sequence [ refs.oneOf."166", { _ | Dyn } ])
          },
      oneOf."166" =
        {
            succeededCount | std.number.Integer | optional,
            succeededIndexes | String | optional
          },
      oneOf."167" =
        {
            failed | Array String | optional,
            succeeded | Array String | optional
          },
      oneOf."168" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'CertificateSigningRequest |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."171" | { _ | Dyn },
            status | refs.oneOf."172" | { _ | Dyn } | optional
          },
      oneOf."169" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            lastUpdateTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."171" =
        {
            expirationSeconds | std.number.Integer | optional,
            extra | { _ | Array String } | optional,
            groups | Array String | optional,
            request | String,
            signerName | String,
            uid | String | optional,
            usages | Array String | optional,
            username | String | optional
          },
      oneOf."172" =
        {
            certificate | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."169", { _ | Dyn } ])
              | optional
          },
      oneOf."173" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterTrustBundle |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."175" | { _ | Dyn }
          },
      oneOf."175" = { signerName | String | optional, trustBundle | String },
      oneOf."176" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterTrustBundle |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."178" | { _ | Dyn }
          },
      oneOf."178" = { signerName | String | optional, trustBundle | String },
      oneOf."179" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Lease |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."181" | { _ | Dyn } | optional
          },
      oneOf."18" =
        {
            auditAnnotations
              | Array (std.contract.Sequence [ refs.oneOf."0", { _ | Dyn } ])
              | optional,
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."2", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."3" | { _ | Dyn } | optional,
            paramKind | refs.oneOf."8" | { _ | Dyn } | optional,
            validations
              | Array (std.contract.Sequence [ refs.oneOf."23", { _ | Dyn } ])
              | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."24", { _ | Dyn } ])
              | optional
          },
      oneOf."181" =
        {
            acquireTime | refs.oneOf."687" | String | optional,
            holderIdentity | String | optional,
            leaseDurationSeconds | std.number.Integer | optional,
            leaseTransitions | std.number.Integer | optional,
            preferredHolder | String | optional,
            renewTime | refs.oneOf."687" | String | optional,
            strategy | String | optional
          },
      oneOf."182" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LeaseCandidate |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."184" | { _ | Dyn } | optional
          },
      oneOf."184" =
        {
            binaryVersion | String,
            emulationVersion | String | optional,
            leaseName | String,
            pingTime | refs.oneOf."687" | String | optional,
            renewTime | refs.oneOf."687" | String | optional,
            strategy | String
          },
      oneOf."185" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LeaseCandidate |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."187" | { _ | Dyn } | optional
          },
      oneOf."187" =
        {
            binaryVersion | String,
            emulationVersion | String | optional,
            leaseName | String,
            pingTime | refs.oneOf."687" | String | optional,
            renewTime | refs.oneOf."687" | String | optional,
            strategy | String
          },
      oneOf."188" =
        {
            fsType | String | optional,
            partition | std.number.Integer | optional,
            readOnly | Bool | optional,
            volumeID | String
          },
      oneOf."189" =
        {
            nodeAffinity | refs.oneOf."283" | { _ | Dyn } | optional,
            podAffinity | refs.oneOf."314" | { _ | Dyn } | optional,
            podAntiAffinity | refs.oneOf."316" | { _ | Dyn } | optional
          },
      oneOf."19" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            typeChecking | refs.oneOf."12" | { _ | Dyn } | optional
          },
      oneOf."190" = { localhostProfile | String | optional, type | String },
      oneOf."191" = { devicePath | String, name | String },
      oneOf."192" =
        {
            cachingMode | String | optional,
            diskName | String,
            diskURI | String,
            fsType | String | optional,
            kind | String | optional,
            readOnly | Bool | optional
          },
      oneOf."193" =
        {
            readOnly | Bool | optional,
            secretName | String,
            secretNamespace | String | optional,
            shareName | String
          },
      oneOf."194" =
        { readOnly | Bool | optional, secretName | String, shareName | String },
      oneOf."196" =
        {
            controllerExpandSecretRef
              | refs.oneOf."366"
              | { _ | Dyn }
              | optional,
            controllerPublishSecretRef
              | refs.oneOf."366"
              | { _ | Dyn }
              | optional,
            driver | String,
            fsType | String | optional,
            nodeExpandSecretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            nodePublishSecretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            nodeStageSecretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            readOnly | Bool | optional,
            volumeAttributes | { _ | String } | optional,
            volumeHandle | String
          },
      oneOf."197" =
        {
            driver | String,
            fsType | String | optional,
            nodePublishSecretRef | refs.oneOf."272" | { _ | Dyn } | optional,
            readOnly | Bool | optional,
            volumeAttributes | { _ | String } | optional
          },
      oneOf."198" =
        { add | Array String | optional, drop | Array String | optional },
      oneOf."199" =
        {
            monitors | Array String,
            path | String | optional,
            readOnly | Bool | optional,
            secretFile | String | optional,
            secretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."2" = { expression | String, name | String },
      oneOf."20" =
        {
            admissionReviewVersions | Array String,
            clientConfig | refs.oneOf."25" | { _ | Dyn },
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."2", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            name | String,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."10", { _ | Dyn } ])
              | optional,
            sideEffects | String,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."200" =
        {
            monitors | Array String,
            path | String | optional,
            readOnly | Bool | optional,
            secretFile | String | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."201" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            volumeID | String
          },
      oneOf."202" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn } | optional,
            volumeID | String
          },
      oneOf."203" = { timeoutSeconds | std.number.Integer | optional },
      oneOf."204" =
        {
            labelSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            name | String | optional,
            "optional" | Bool | optional,
            path | String,
            signerName | String | optional
          },
      oneOf."205" =
        {
            error | String | optional,
            message | String | optional,
            status | String,
            type | String
          },
      oneOf."206" =
        {
            apiVersion | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."205", { _ | Dyn } ])
              | optional,
            kind | std.enum.TagOrString | [| 'ComponentStatus |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional
          },
      oneOf."208" =
        {
            apiVersion | String | optional,
            binaryData | { _ | String } | optional,
            data | { _ | String } | optional,
            immutable | Bool | optional,
            kind | std.enum.TagOrString | [| 'ConfigMap |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional
          },
      oneOf."209" = { name | String | optional, "optional" | Bool | optional },
      oneOf."21" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingWebhookConfiguration |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            webhooks
              | Array (std.contract.Sequence [ refs.oneOf."20", { _ | Dyn } ])
              | optional
          },
      oneOf."210" =
        {
            key | String,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."212" =
        {
            kubeletConfigKey | String,
            name | String,
            namespace | String,
            resourceVersion | String | optional,
            uid | String | optional
          },
      oneOf."213" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."262", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."214" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."262", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."215" =
        {
            args | Array String | optional,
            command | Array String | optional,
            env
              | Array (std.contract.Sequence [ refs.oneOf."236", { _ | Dyn } ])
              | optional,
            envFrom
              | Array (std.contract.Sequence [ refs.oneOf."235", { _ | Dyn } ])
              | optional,
            image | String | optional,
            imagePullPolicy | String | optional,
            lifecycle | refs.oneOf."263" | { _ | Dyn } | optional,
            livenessProbe | refs.oneOf."336" | { _ | Dyn } | optional,
            name | String,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."217", { _ | Dyn } ])
              | optional,
            readinessProbe | refs.oneOf."336" | { _ | Dyn } | optional,
            resizePolicy
              | Array (std.contract.Sequence [ refs.oneOf."218", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."353" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            securityContext | refs.oneOf."368" | { _ | Dyn } | optional,
            startupProbe | refs.oneOf."336" | { _ | Dyn } | optional,
            stdin | Bool | optional,
            stdinOnce | Bool | optional,
            terminationMessagePath | String | optional,
            terminationMessagePolicy | String | optional,
            tty | Bool | optional,
            volumeDevices
              | Array (std.contract.Sequence [ refs.oneOf."391", { _ | Dyn } ])
              | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."392", { _ | Dyn } ])
              | optional,
            workingDir | String | optional
          },
      oneOf."216" =
        {
            names | Array String | optional,
            sizeBytes | std.number.Integer | optional
          },
      oneOf."217" =
        {
            containerPort | std.number.Integer,
            hostIP | String | optional,
            hostPort | std.number.Integer | optional,
            name | String | optional,
            protocol | String | optional
          },
      oneOf."218" = { resourceName | String, restartPolicy | String },
      oneOf."219" =
        {
            running | refs.oneOf."220" | { _ | Dyn } | optional,
            terminated | refs.oneOf."221" | { _ | Dyn } | optional,
            waiting | refs.oneOf."222" | { _ | Dyn } | optional
          },
      oneOf."220" = { startedAt | refs.oneOf."696" | String | optional },
      oneOf."221" =
        {
            containerID | String | optional,
            exitCode | std.number.Integer,
            finishedAt | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            signal | std.number.Integer | optional,
            startedAt | refs.oneOf."696" | String | optional
          },
      oneOf."222" = { message | String | optional, reason | String | optional },
      oneOf."223" =
        {
            allocatedResources | { _ | refs.oneOf."672" } | optional,
            allocatedResourcesStatus
              | Array (std.contract.Sequence [ refs.oneOf."354", { _ | Dyn } ])
              | optional,
            containerID | String | optional,
            image | String,
            imageID | String,
            lastState | refs.oneOf."219" | { _ | Dyn } | optional,
            name | String,
            ready | Bool,
            resources | refs.oneOf."353" | { _ | Dyn } | optional,
            restartCount | std.number.Integer,
            started | Bool | optional,
            state | refs.oneOf."219" | { _ | Dyn } | optional,
            stopSignal | String | optional,
            user | refs.oneOf."224" | { _ | Dyn } | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."393", { _ | Dyn } ])
              | optional
          },
      oneOf."224" = { linux | refs.oneOf."269" | { _ | Dyn } | optional },
      oneOf."225" = { Port | std.number.Integer },
      oneOf."226" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."227", { _ | Dyn } ])
              | optional
          },
      oneOf."227" =
        {
            fieldRef | refs.oneOf."299" | { _ | Dyn } | optional,
            mode | std.number.Integer | optional,
            path | String,
            resourceFieldRef | refs.oneOf."347" | { _ | Dyn } | optional
          },
      oneOf."228" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."227", { _ | Dyn } ])
              | optional
          },
      oneOf."229" =
        { medium | String | optional, sizeLimit | refs.oneOf."672" | optional },
      oneOf."23" =
        {
            expression | String,
            message | String | optional,
            messageExpression | String | optional,
            reason | String | optional
          },
      oneOf."230" =
        {
            hostname | String | optional,
            ip | String,
            nodeName | String | optional,
            targetRef | refs.oneOf."300" | { _ | Dyn } | optional
          },
      oneOf."231" =
        {
            appProtocol | String | optional,
            name | String | optional,
            port | std.number.Integer,
            protocol | String | optional
          },
      oneOf."232" =
        {
            addresses
              | Array (std.contract.Sequence [ refs.oneOf."230", { _ | Dyn } ])
              | optional,
            notReadyAddresses
              | Array (std.contract.Sequence [ refs.oneOf."230", { _ | Dyn } ])
              | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."231", { _ | Dyn } ])
              | optional
          },
      oneOf."233" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Endpoints |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            subsets
              | Array (std.contract.Sequence [ refs.oneOf."232", { _ | Dyn } ])
              | optional
          },
      oneOf."235" =
        {
            configMapRef | refs.oneOf."209" | { _ | Dyn } | optional,
            prefix | String | optional,
            secretRef | refs.oneOf."362" | { _ | Dyn } | optional
          },
      oneOf."236" =
        {
            name | String,
            value | String | optional,
            valueFrom | refs.oneOf."237" | { _ | Dyn } | optional
          },
      oneOf."237" =
        {
            configMapKeyRef | refs.oneOf."210" | { _ | Dyn } | optional,
            fieldRef | refs.oneOf."299" | { _ | Dyn } | optional,
            resourceFieldRef | refs.oneOf."347" | { _ | Dyn } | optional,
            secretKeyRef | refs.oneOf."363" | { _ | Dyn } | optional
          },
      oneOf."238" =
        {
            args | Array String | optional,
            command | Array String | optional,
            env
              | Array (std.contract.Sequence [ refs.oneOf."236", { _ | Dyn } ])
              | optional,
            envFrom
              | Array (std.contract.Sequence [ refs.oneOf."235", { _ | Dyn } ])
              | optional,
            image | String | optional,
            imagePullPolicy | String | optional,
            lifecycle | refs.oneOf."263" | { _ | Dyn } | optional,
            livenessProbe | refs.oneOf."336" | { _ | Dyn } | optional,
            name | String,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."217", { _ | Dyn } ])
              | optional,
            readinessProbe | refs.oneOf."336" | { _ | Dyn } | optional,
            resizePolicy
              | Array (std.contract.Sequence [ refs.oneOf."218", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."353" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            securityContext | refs.oneOf."368" | { _ | Dyn } | optional,
            startupProbe | refs.oneOf."336" | { _ | Dyn } | optional,
            stdin | Bool | optional,
            stdinOnce | Bool | optional,
            targetContainerName | String | optional,
            terminationMessagePath | String | optional,
            terminationMessagePolicy | String | optional,
            tty | Bool | optional,
            volumeDevices
              | Array (std.contract.Sequence [ refs.oneOf."391", { _ | Dyn } ])
              | optional,
            volumeMounts
              | Array (std.contract.Sequence [ refs.oneOf."392", { _ | Dyn } ])
              | optional,
            workingDir | String | optional
          },
      oneOf."239" =
        { volumeClaimTemplate | refs.oneOf."307" | { _ | Dyn } | optional },
      oneOf."24" = { expression | String, name | String },
      oneOf."240" =
        {
            action | String | optional,
            apiVersion | String | optional,
            count | std.number.Integer | optional,
            eventTime | refs.oneOf."687" | String | optional,
            firstTimestamp | refs.oneOf."696" | String | optional,
            involvedObject | refs.oneOf."300" | { _ | Dyn },
            kind | std.enum.TagOrString | [| 'Event |] | optional,
            lastTimestamp | refs.oneOf."696" | String | optional,
            message | String | optional,
            metadata | refs.oneOf."688" | { _ | Dyn },
            reason | String | optional,
            related | refs.oneOf."300" | { _ | Dyn } | optional,
            reportingComponent | String | optional,
            reportingInstance | String | optional,
            series | refs.oneOf."242" | { _ | Dyn } | optional,
            source | refs.oneOf."243" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."242" =
        {
            count | std.number.Integer | optional,
            lastObservedTime | refs.oneOf."687" | String | optional
          },
      oneOf."243" = { component | String | optional, host | String | optional },
      oneOf."244" = { command | Array String | optional },
      oneOf."245" =
        {
            fsType | String | optional,
            lun | std.number.Integer | optional,
            readOnly | Bool | optional,
            targetWWNs | Array String | optional,
            wwids | Array String | optional
          },
      oneOf."246" =
        {
            driver | String,
            fsType | String | optional,
            options | { _ | String } | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."366" | { _ | Dyn } | optional
          },
      oneOf."247" =
        {
            driver | String,
            fsType | String | optional,
            options | { _ | String } | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn } | optional
          },
      oneOf."248" =
        { datasetName | String | optional, datasetUUID | String | optional },
      oneOf."249" =
        {
            fsType | String | optional,
            partition | std.number.Integer | optional,
            pdName | String,
            readOnly | Bool | optional
          },
      oneOf."25" =
        {
            caBundle | String | optional,
            service | refs.oneOf."11" | { _ | Dyn } | optional,
            url | String | optional
          },
      oneOf."250" = { port | std.number.Integer, service | String | optional },
      oneOf."251" =
        {
            directory | String | optional,
            repository | String,
            revision | String | optional
          },
      oneOf."252" =
        {
            endpoints | String,
            endpointsNamespace | String | optional,
            path | String,
            readOnly | Bool | optional
          },
      oneOf."253" =
        { endpoints | String, path | String, readOnly | Bool | optional },
      oneOf."254" =
        {
            host | String | optional,
            httpHeaders
              | Array (std.contract.Sequence [ refs.oneOf."255", { _ | Dyn } ])
              | optional,
            path | String | optional,
            port | refs.oneOf."699",
            scheme | String | optional
          },
      oneOf."255" = { name | String, value | String },
      oneOf."256" = { hostnames | Array String | optional, ip | String },
      oneOf."257" = { ip | String },
      oneOf."258" = { path | String, type | String | optional },
      oneOf."259" =
        {
            chapAuthDiscovery | Bool | optional,
            chapAuthSession | Bool | optional,
            fsType | String | optional,
            initiatorName | String | optional,
            iqn | String,
            iscsiInterface | String | optional,
            lun | std.number.Integer,
            portals | Array String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            targetPortal | String
          },
      oneOf."26" = { expression | String | optional },
      oneOf."260" =
        {
            chapAuthDiscovery | Bool | optional,
            chapAuthSession | Bool | optional,
            fsType | String | optional,
            initiatorName | String | optional,
            iqn | String,
            iscsiInterface | String | optional,
            lun | std.number.Integer,
            portals | Array String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn } | optional,
            targetPortal | String
          },
      oneOf."261" =
        { pullPolicy | String | optional, reference | String | optional },
      oneOf."262" =
        { key | String, mode | std.number.Integer | optional, path | String },
      oneOf."263" =
        {
            postStart | refs.oneOf."264" | { _ | Dyn } | optional,
            preStop | refs.oneOf."264" | { _ | Dyn } | optional,
            stopSignal | String | optional
          },
      oneOf."264" =
        {
            exec | refs.oneOf."244" | { _ | Dyn } | optional,
            httpGet | refs.oneOf."254" | { _ | Dyn } | optional,
            sleep | refs.oneOf."378" | { _ | Dyn } | optional,
            tcpSocket | refs.oneOf."382" | { _ | Dyn } | optional
          },
      oneOf."265" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'LimitRange |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."268" | { _ | Dyn } | optional
          },
      oneOf."266" =
        {
            "default" | { _ | refs.oneOf."672" } | optional,
            defaultRequest | { _ | refs.oneOf."672" } | optional,
            max | { _ | refs.oneOf."672" } | optional,
            maxLimitRequestRatio | { _ | refs.oneOf."672" } | optional,
            min | { _ | refs.oneOf."672" } | optional,
            type | String
          },
      oneOf."268" =
        {
            limits
              | Array (std.contract.Sequence [ refs.oneOf."266", { _ | Dyn } ])
          },
      oneOf."269" =
        {
            gid | std.number.Integer,
            supplementalGroups | Array std.number.Integer | optional,
            uid | std.number.Integer
          },
      oneOf."27" = { expression | String | optional },
      oneOf."270" =
        {
            hostname | String | optional,
            ip | String | optional,
            ipMode | String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."333", { _ | Dyn } ])
              | optional
          },
      oneOf."271" =
        {
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."270", { _ | Dyn } ])
              | optional
          },
      oneOf."272" = { name | String | optional },
      oneOf."273" = { fsType | String | optional, path | String },
      oneOf."274" =
        {
            status | String,
            targetVolumeAttributesClassName | String | optional
          },
      oneOf."275" =
        { path | String, readOnly | Bool | optional, server | String },
      oneOf."276" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Namespace |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."279" | { _ | Dyn } | optional,
            status | refs.oneOf."280" | { _ | Dyn } | optional
          },
      oneOf."277" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."279" = { finalizers | Array String | optional },
      oneOf."28" = { expression | String, name | String },
      oneOf."280" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."277", { _ | Dyn } ])
              | optional,
            phase | String | optional
          },
      oneOf."281" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Node |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."295" | { _ | Dyn } | optional,
            status | refs.oneOf."296" | { _ | Dyn } | optional
          },
      oneOf."282" = { address | String, type | String },
      oneOf."283" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."335", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | refs.oneOf."292"
              | { _ | Dyn }
              | optional
          },
      oneOf."284" =
        {
            lastHeartbeatTime | refs.oneOf."696" | String | optional,
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."285" = { configMap | refs.oneOf."212" | { _ | Dyn } | optional },
      oneOf."286" =
        {
            active | refs.oneOf."285" | { _ | Dyn } | optional,
            assigned | refs.oneOf."285" | { _ | Dyn } | optional,
            error | String | optional,
            lastKnownGood | refs.oneOf."285" | { _ | Dyn } | optional
          },
      oneOf."287" =
        { kubeletEndpoint | refs.oneOf."225" | { _ | Dyn } | optional },
      oneOf."288" = { supplementalGroupsPolicy | Bool | optional },
      oneOf."29" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."37", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."37", { _ | Dyn } ])
              | optional
          },
      oneOf."290" =
        {
            features | refs.oneOf."291" | { _ | Dyn } | optional,
            name | String | optional
          },
      oneOf."291" =
        {
            recursiveReadOnlyMounts | Bool | optional,
            userNamespaces | Bool | optional
          },
      oneOf."292" =
        {
            nodeSelectorTerms
              | Array (std.contract.Sequence [ refs.oneOf."294", { _ | Dyn } ])
          },
      oneOf."293" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."294" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."293", { _ | Dyn } ])
              | optional,
            matchFields
              | Array (std.contract.Sequence [ refs.oneOf."293", { _ | Dyn } ])
              | optional
          },
      oneOf."295" =
        {
            configSource | refs.oneOf."285" | { _ | Dyn } | optional,
            externalID | String | optional,
            podCIDR | String | optional,
            podCIDRs | Array String | optional,
            providerID | String | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."383", { _ | Dyn } ])
              | optional,
            unschedulable | Bool | optional
          },
      oneOf."296" =
        {
            addresses
              | Array (std.contract.Sequence [ refs.oneOf."282", { _ | Dyn } ])
              | optional,
            allocatable | { _ | refs.oneOf."672" } | optional,
            capacity | { _ | refs.oneOf."672" } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."284", { _ | Dyn } ])
              | optional,
            config | refs.oneOf."286" | { _ | Dyn } | optional,
            daemonEndpoints | refs.oneOf."287" | { _ | Dyn } | optional,
            features | refs.oneOf."288" | { _ | Dyn } | optional,
            images
              | Array (std.contract.Sequence [ refs.oneOf."216", { _ | Dyn } ])
              | optional,
            nodeInfo | refs.oneOf."298" | { _ | Dyn } | optional,
            phase | String | optional,
            runtimeHandlers
              | Array (std.contract.Sequence [ refs.oneOf."290", { _ | Dyn } ])
              | optional,
            volumesAttached
              | Array (std.contract.Sequence [ refs.oneOf."191", { _ | Dyn } ])
              | optional,
            volumesInUse | Array String | optional
          },
      oneOf."297" = { capacity | std.number.Integer | optional },
      oneOf."298" =
        {
            architecture | String,
            bootID | String,
            containerRuntimeVersion | String,
            kernelVersion | String,
            kubeProxyVersion | String,
            kubeletVersion | String,
            machineID | String,
            operatingSystem | String,
            osImage | String,
            swap | refs.oneOf."297" | { _ | Dyn } | optional,
            systemUUID | String
          },
      oneOf."299" = { apiVersion | String | optional, fieldPath | String },
      oneOf."3" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."7", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."7", { _ | Dyn } ])
              | optional
          },
      oneOf."30" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."35" | { _ | Dyn } | optional
          },
      oneOf."300" =
        {
            apiVersion | String | optional,
            fieldPath | String | optional,
            kind | String | optional,
            name | String | optional,
            namespace | String | optional,
            resourceVersion | String | optional,
            uid | String | optional
          },
      oneOf."301" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PersistentVolume |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."310" | { _ | Dyn } | optional,
            status | refs.oneOf."311" | { _ | Dyn } | optional
          },
      oneOf."302" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PersistentVolumeClaim |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."305" | { _ | Dyn } | optional,
            status | refs.oneOf."306" | { _ | Dyn } | optional
          },
      oneOf."303" =
        {
            lastProbeTime | refs.oneOf."696" | String | optional,
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."305" =
        {
            accessModes | Array String | optional,
            dataSource | refs.oneOf."388" | { _ | Dyn } | optional,
            dataSourceRef | refs.oneOf."389" | { _ | Dyn } | optional,
            resources | refs.oneOf."396" | { _ | Dyn } | optional,
            selector | refs.oneOf."683" | { _ | Dyn } | optional,
            storageClassName | String | optional,
            volumeAttributesClassName | String | optional,
            volumeMode | String | optional,
            volumeName | String | optional
          },
      oneOf."306" =
        {
            accessModes | Array String | optional,
            allocatedResourceStatuses | { _ | String } | optional,
            allocatedResources | { _ | refs.oneOf."672" } | optional,
            capacity | { _ | refs.oneOf."672" } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."303", { _ | Dyn } ])
              | optional,
            currentVolumeAttributesClassName | String | optional,
            modifyVolumeStatus | refs.oneOf."274" | { _ | Dyn } | optional,
            phase | String | optional
          },
      oneOf."307" =
        {
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."305" | { _ | Dyn }
          },
      oneOf."308" = { claimName | String, readOnly | Bool | optional },
      oneOf."31" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."33" | { _ | Dyn } | optional
          },
      oneOf."310" =
        {
            accessModes | Array String | optional,
            awsElasticBlockStore | refs.oneOf."188" | { _ | Dyn } | optional,
            azureDisk | refs.oneOf."192" | { _ | Dyn } | optional,
            azureFile | refs.oneOf."193" | { _ | Dyn } | optional,
            capacity | { _ | refs.oneOf."672" } | optional,
            cephfs | refs.oneOf."199" | { _ | Dyn } | optional,
            cinder | refs.oneOf."201" | { _ | Dyn } | optional,
            claimRef | refs.oneOf."300" | { _ | Dyn } | optional,
            csi | refs.oneOf."196" | { _ | Dyn } | optional,
            fc | refs.oneOf."245" | { _ | Dyn } | optional,
            flexVolume | refs.oneOf."246" | { _ | Dyn } | optional,
            flocker | refs.oneOf."248" | { _ | Dyn } | optional,
            gcePersistentDisk | refs.oneOf."249" | { _ | Dyn } | optional,
            glusterfs | refs.oneOf."252" | { _ | Dyn } | optional,
            hostPath | refs.oneOf."258" | { _ | Dyn } | optional,
            iscsi | refs.oneOf."259" | { _ | Dyn } | optional,
            local | refs.oneOf."273" | { _ | Dyn } | optional,
            mountOptions | Array String | optional,
            nfs | refs.oneOf."275" | { _ | Dyn } | optional,
            nodeAffinity | refs.oneOf."394" | { _ | Dyn } | optional,
            persistentVolumeReclaimPolicy | String | optional,
            photonPersistentDisk | refs.oneOf."312" | { _ | Dyn } | optional,
            portworxVolume | refs.oneOf."334" | { _ | Dyn } | optional,
            quobyte | refs.oneOf."338" | { _ | Dyn } | optional,
            rbd | refs.oneOf."339" | { _ | Dyn } | optional,
            scaleIO | refs.oneOf."356" | { _ | Dyn } | optional,
            storageClassName | String | optional,
            storageos | refs.oneOf."379" | { _ | Dyn } | optional,
            volumeAttributesClassName | String | optional,
            volumeMode | String | optional,
            vsphereVolume | refs.oneOf."397" | { _ | Dyn } | optional
          },
      oneOf."311" =
        {
            lastPhaseTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            phase | String | optional,
            reason | String | optional
          },
      oneOf."312" = { fsType | String | optional, pdID | String },
      oneOf."313" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Pod |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."328" | { _ | Dyn } | optional,
            status | refs.oneOf."329" | { _ | Dyn } | optional
          },
      oneOf."314" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."398", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."315", { _ | Dyn } ])
              | optional
          },
      oneOf."315" =
        {
            labelSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            matchLabelKeys | Array String | optional,
            mismatchLabelKeys | Array String | optional,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            namespaces | Array String | optional,
            topologyKey | String
          },
      oneOf."316" =
        {
            preferredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."398", { _ | Dyn } ])
              | optional,
            requiredDuringSchedulingIgnoredDuringExecution
              | Array (std.contract.Sequence [ refs.oneOf."315", { _ | Dyn } ])
              | optional
          },
      oneOf."317" =
        {
            lastProbeTime | refs.oneOf."696" | String | optional,
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            observedGeneration | std.number.Integer | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."318" =
        {
            nameservers | Array String | optional,
            options
              | Array (std.contract.Sequence [ refs.oneOf."319", { _ | Dyn } ])
              | optional,
            searches | Array String | optional
          },
      oneOf."319" = { name | String | optional, value | String | optional },
      oneOf."320" = { ip | String },
      oneOf."322" = { name | String },
      oneOf."323" = { conditionType | String },
      oneOf."324" =
        {
            name | String,
            resourceClaimName | String | optional,
            resourceClaimTemplateName | String | optional
          },
      oneOf."325" = { name | String, resourceClaimName | String | optional },
      oneOf."326" = { name | String },
      oneOf."327" =
        {
            appArmorProfile | refs.oneOf."190" | { _ | Dyn } | optional,
            fsGroup | std.number.Integer | optional,
            fsGroupChangePolicy | String | optional,
            runAsGroup | std.number.Integer | optional,
            runAsNonRoot | Bool | optional,
            runAsUser | std.number.Integer | optional,
            seLinuxChangePolicy | String | optional,
            seLinuxOptions | refs.oneOf."355" | { _ | Dyn } | optional,
            seccompProfile | refs.oneOf."360" | { _ | Dyn } | optional,
            supplementalGroups | Array std.number.Integer | optional,
            supplementalGroupsPolicy | String | optional,
            sysctls
              | Array (std.contract.Sequence [ refs.oneOf."381", { _ | Dyn } ])
              | optional,
            windowsOptions | refs.oneOf."399" | { _ | Dyn } | optional
          },
      oneOf."328" =
        {
            activeDeadlineSeconds | std.number.Integer | optional,
            affinity | refs.oneOf."189" | { _ | Dyn } | optional,
            automountServiceAccountToken | Bool | optional,
            containers
              | Array (std.contract.Sequence [ refs.oneOf."215", { _ | Dyn } ]),
            dnsConfig | refs.oneOf."318" | { _ | Dyn } | optional,
            dnsPolicy | String | optional,
            enableServiceLinks | Bool | optional,
            ephemeralContainers
              | Array (std.contract.Sequence [ refs.oneOf."238", { _ | Dyn } ])
              | optional,
            hostAliases
              | Array (std.contract.Sequence [ refs.oneOf."256", { _ | Dyn } ])
              | optional,
            hostIPC | Bool | optional,
            hostNetwork | Bool | optional,
            hostPID | Bool | optional,
            hostUsers | Bool | optional,
            hostname | String | optional,
            imagePullSecrets
              | Array (std.contract.Sequence [ refs.oneOf."272", { _ | Dyn } ])
              | optional,
            initContainers
              | Array (std.contract.Sequence [ refs.oneOf."215", { _ | Dyn } ])
              | optional,
            nodeName | String | optional,
            nodeSelector | { _ | String } | optional,
            os | refs.oneOf."322" | { _ | Dyn } | optional,
            overhead | { _ | refs.oneOf."672" } | optional,
            preemptionPolicy | String | optional,
            "priority" | std.number.Integer | optional,
            priorityClassName | String | optional,
            readinessGates
              | Array (std.contract.Sequence [ refs.oneOf."323", { _ | Dyn } ])
              | optional,
            resourceClaims
              | Array (std.contract.Sequence [ refs.oneOf."324", { _ | Dyn } ])
              | optional,
            resources | refs.oneOf."353" | { _ | Dyn } | optional,
            restartPolicy | String | optional,
            runtimeClassName | String | optional,
            schedulerName | String | optional,
            schedulingGates
              | Array (std.contract.Sequence [ refs.oneOf."326", { _ | Dyn } ])
              | optional,
            securityContext | refs.oneOf."327" | { _ | Dyn } | optional,
            serviceAccount | String | optional,
            serviceAccountName | String | optional,
            setHostnameAsFQDN | Bool | optional,
            shareProcessNamespace | Bool | optional,
            subdomain | String | optional,
            terminationGracePeriodSeconds | std.number.Integer | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."384", { _ | Dyn } ])
              | optional,
            topologySpreadConstraints
              | Array (std.contract.Sequence [ refs.oneOf."387", { _ | Dyn } ])
              | optional,
            volumes
              | Array (std.contract.Sequence [ refs.oneOf."390", { _ | Dyn } ])
              | optional
          },
      oneOf."329" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."317", { _ | Dyn } ])
              | optional,
            containerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."223", { _ | Dyn } ])
              | optional,
            ephemeralContainerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."223", { _ | Dyn } ])
              | optional,
            hostIP | String | optional,
            hostIPs
              | Array (std.contract.Sequence [ refs.oneOf."257", { _ | Dyn } ])
              | optional,
            initContainerStatuses
              | Array (std.contract.Sequence [ refs.oneOf."223", { _ | Dyn } ])
              | optional,
            message | String | optional,
            nominatedNodeName | String | optional,
            observedGeneration | std.number.Integer | optional,
            phase | String | optional,
            podIP | String | optional,
            podIPs
              | Array (std.contract.Sequence [ refs.oneOf."320", { _ | Dyn } ])
              | optional,
            qosClass | String | optional,
            reason | String | optional,
            resize | String | optional,
            resourceClaimStatuses
              | Array (std.contract.Sequence [ refs.oneOf."325", { _ | Dyn } ])
              | optional,
            startTime | refs.oneOf."696" | String | optional
          },
      oneOf."33" =
        {
            matchResources | refs.oneOf."29" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."39" | { _ | Dyn } | optional,
            policyName | String | optional
          },
      oneOf."330" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PodTemplate |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            template | refs.oneOf."332" | { _ | Dyn } | optional
          },
      oneOf."332" =
        {
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."328" | { _ | Dyn } | optional
          },
      oneOf."333" =
        {
            error | String | optional,
            port | std.number.Integer,
            protocol | String
          },
      oneOf."334" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            volumeID | String
          },
      oneOf."335" =
        {
            preference | refs.oneOf."294" | { _ | Dyn },
            weight | std.number.Integer
          },
      oneOf."336" =
        {
            exec | refs.oneOf."244" | { _ | Dyn } | optional,
            failureThreshold | std.number.Integer | optional,
            grpc | refs.oneOf."250" | { _ | Dyn } | optional,
            httpGet | refs.oneOf."254" | { _ | Dyn } | optional,
            initialDelaySeconds | std.number.Integer | optional,
            periodSeconds | std.number.Integer | optional,
            successThreshold | std.number.Integer | optional,
            tcpSocket | refs.oneOf."382" | { _ | Dyn } | optional,
            terminationGracePeriodSeconds | std.number.Integer | optional,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."337" =
        {
            defaultMode | std.number.Integer | optional,
            sources
              | Array (std.contract.Sequence [ refs.oneOf."395", { _ | Dyn } ])
              | optional
          },
      oneOf."338" =
        {
            group | String | optional,
            readOnly | Bool | optional,
            registry | String,
            tenant | String | optional,
            user | String | optional,
            volume | String
          },
      oneOf."339" =
        {
            fsType | String | optional,
            image | String,
            keyring | String | optional,
            monitors | Array String,
            pool | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."366" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."340" =
        {
            fsType | String | optional,
            image | String,
            keyring | String | optional,
            monitors | Array String,
            pool | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn } | optional,
            user | String | optional
          },
      oneOf."341" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ReplicationController |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."344" | { _ | Dyn } | optional,
            status | refs.oneOf."345" | { _ | Dyn } | optional
          },
      oneOf."342" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."344" =
        {
            minReadySeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            selector | { _ | String } | optional,
            template | refs.oneOf."332" | { _ | Dyn } | optional
          },
      oneOf."345" =
        {
            availableReplicas | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."342", { _ | Dyn } ])
              | optional,
            fullyLabeledReplicas | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer
          },
      oneOf."346" = { name | String, request | String | optional },
      oneOf."347" =
        {
            containerName | String | optional,
            divisor | refs.oneOf."672" | optional,
            resource | String
          },
      oneOf."348" = { health | String | optional, resourceID | String },
      oneOf."349" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceQuota |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."351" | { _ | Dyn } | optional,
            status | refs.oneOf."352" | { _ | Dyn } | optional
          },
      oneOf."35" =
        {
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."28", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."29" | { _ | Dyn } | optional,
            mutations
              | Array (std.contract.Sequence [ refs.oneOf."36", { _ | Dyn } ])
              | optional,
            paramKind | refs.oneOf."38" | { _ | Dyn } | optional,
            reinvocationPolicy | String | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."40", { _ | Dyn } ])
              | optional
          },
      oneOf."351" =
        {
            hard | { _ | refs.oneOf."672" } | optional,
            scopeSelector | refs.oneOf."358" | { _ | Dyn } | optional,
            scopes | Array String | optional
          },
      oneOf."352" =
        {
            hard | { _ | refs.oneOf."672" } | optional,
            used | { _ | refs.oneOf."672" } | optional
          },
      oneOf."353" =
        {
            claims
              | Array (std.contract.Sequence [ refs.oneOf."346", { _ | Dyn } ])
              | optional,
            limits | { _ | refs.oneOf."672" } | optional,
            requests | { _ | refs.oneOf."672" } | optional
          },
      oneOf."354" =
        {
            name | String,
            resources
              | Array (std.contract.Sequence [ refs.oneOf."348", { _ | Dyn } ])
              | optional
          },
      oneOf."355" =
        {
            level | String | optional,
            role | String | optional,
            type | String | optional,
            user | String | optional
          },
      oneOf."356" =
        {
            fsType | String | optional,
            gateway | String,
            protectionDomain | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."366" | { _ | Dyn },
            sslEnabled | Bool | optional,
            storageMode | String | optional,
            storagePool | String | optional,
            system | String,
            volumeName | String | optional
          },
      oneOf."357" =
        {
            fsType | String | optional,
            gateway | String,
            protectionDomain | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn },
            sslEnabled | Bool | optional,
            storageMode | String | optional,
            storagePool | String | optional,
            system | String,
            volumeName | String | optional
          },
      oneOf."358" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."359", { _ | Dyn } ])
              | optional
          },
      oneOf."359" =
        {
            operator | String,
            scopeName | String,
            values | Array String | optional
          },
      oneOf."36" =
        {
            applyConfiguration | refs.oneOf."26" | { _ | Dyn } | optional,
            jsonPatch | refs.oneOf."27" | { _ | Dyn } | optional,
            patchType | String
          },
      oneOf."360" = { localhostProfile | String | optional, type | String },
      oneOf."361" =
        {
            apiVersion | String | optional,
            data | { _ | String } | optional,
            immutable | Bool | optional,
            kind | std.enum.TagOrString | [| 'Secret |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            stringData | { _ | String } | optional,
            type | String | optional
          },
      oneOf."362" = { name | String | optional, "optional" | Bool | optional },
      oneOf."363" =
        {
            key | String,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."365" =
        {
            items
              | Array (std.contract.Sequence [ refs.oneOf."262", { _ | Dyn } ])
              | optional,
            name | String | optional,
            "optional" | Bool | optional
          },
      oneOf."366" = { name | String | optional, namespace | String | optional },
      oneOf."367" =
        {
            defaultMode | std.number.Integer | optional,
            items
              | Array (std.contract.Sequence [ refs.oneOf."262", { _ | Dyn } ])
              | optional,
            "optional" | Bool | optional,
            secretName | String | optional
          },
      oneOf."368" =
        {
            allowPrivilegeEscalation | Bool | optional,
            appArmorProfile | refs.oneOf."190" | { _ | Dyn } | optional,
            capabilities | refs.oneOf."198" | { _ | Dyn } | optional,
            privileged | Bool | optional,
            procMount | String | optional,
            readOnlyRootFilesystem | Bool | optional,
            runAsGroup | std.number.Integer | optional,
            runAsNonRoot | Bool | optional,
            runAsUser | std.number.Integer | optional,
            seLinuxOptions | refs.oneOf."355" | { _ | Dyn } | optional,
            seccompProfile | refs.oneOf."360" | { _ | Dyn } | optional,
            windowsOptions | refs.oneOf."399" | { _ | Dyn } | optional
          },
      oneOf."369" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Service |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."375" | { _ | Dyn } | optional,
            status | refs.oneOf."376" | { _ | Dyn } | optional
          },
      oneOf."37" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."370" =
        {
            apiVersion | String | optional,
            automountServiceAccountToken | Bool | optional,
            imagePullSecrets
              | Array (std.contract.Sequence [ refs.oneOf."272", { _ | Dyn } ])
              | optional,
            kind | std.enum.TagOrString | [| 'ServiceAccount |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            secrets
              | Array (std.contract.Sequence [ refs.oneOf."300", { _ | Dyn } ])
              | optional
          },
      oneOf."372" =
        {
            audience | String | optional,
            expirationSeconds | std.number.Integer | optional,
            path | String
          },
      oneOf."374" =
        {
            appProtocol | String | optional,
            name | String | optional,
            nodePort | std.number.Integer | optional,
            port | std.number.Integer,
            protocol | String | optional,
            targetPort | refs.oneOf."699" | optional
          },
      oneOf."375" =
        {
            allocateLoadBalancerNodePorts | Bool | optional,
            clusterIP | String | optional,
            clusterIPs | Array String | optional,
            externalIPs | Array String | optional,
            externalName | String | optional,
            externalTrafficPolicy | String | optional,
            healthCheckNodePort | std.number.Integer | optional,
            internalTrafficPolicy | String | optional,
            ipFamilies | Array String | optional,
            ipFamilyPolicy | String | optional,
            loadBalancerClass | String | optional,
            loadBalancerIP | String | optional,
            loadBalancerSourceRanges | Array String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."374", { _ | Dyn } ])
              | optional,
            publishNotReadyAddresses | Bool | optional,
            selector | { _ | String } | optional,
            sessionAffinity | String | optional,
            sessionAffinityConfig | refs.oneOf."377" | { _ | Dyn } | optional,
            trafficDistribution | String | optional,
            type | String | optional
          },
      oneOf."376" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            loadBalancer | refs.oneOf."271" | { _ | Dyn } | optional
          },
      oneOf."377" = { clientIP | refs.oneOf."203" | { _ | Dyn } | optional },
      oneOf."378" = { seconds | std.number.Integer },
      oneOf."379" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."300" | { _ | Dyn } | optional,
            volumeName | String | optional,
            volumeNamespace | String | optional
          },
      oneOf."38" = { apiVersion | String | optional, kind | String | optional },
      oneOf."380" =
        {
            fsType | String | optional,
            readOnly | Bool | optional,
            secretRef | refs.oneOf."272" | { _ | Dyn } | optional,
            volumeName | String | optional,
            volumeNamespace | String | optional
          },
      oneOf."381" = { name | String, value | String },
      oneOf."382" = { host | String | optional, port | refs.oneOf."699" },
      oneOf."383" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."696" | String | optional,
            value | String | optional
          },
      oneOf."384" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."385" = { key | String, values | Array String },
      oneOf."386" =
        {
            matchLabelExpressions
              | Array (std.contract.Sequence [ refs.oneOf."385", { _ | Dyn } ])
              | optional
          },
      oneOf."387" =
        {
            labelSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            matchLabelKeys | Array String | optional,
            maxSkew | std.number.Integer,
            minDomains | std.number.Integer | optional,
            nodeAffinityPolicy | String | optional,
            nodeTaintsPolicy | String | optional,
            topologyKey | String,
            whenUnsatisfiable | String
          },
      oneOf."388" =
        { apiGroup | String | optional, kind | String, name | String },
      oneOf."389" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional
          },
      oneOf."39" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."683" | { _ | Dyn } | optional
          },
      oneOf."390" =
        {
            awsElasticBlockStore | refs.oneOf."188" | { _ | Dyn } | optional,
            azureDisk | refs.oneOf."192" | { _ | Dyn } | optional,
            azureFile | refs.oneOf."194" | { _ | Dyn } | optional,
            cephfs | refs.oneOf."200" | { _ | Dyn } | optional,
            cinder | refs.oneOf."202" | { _ | Dyn } | optional,
            configMap | refs.oneOf."214" | { _ | Dyn } | optional,
            csi | refs.oneOf."197" | { _ | Dyn } | optional,
            downwardAPI | refs.oneOf."228" | { _ | Dyn } | optional,
            emptyDir | refs.oneOf."229" | { _ | Dyn } | optional,
            ephemeral | refs.oneOf."239" | { _ | Dyn } | optional,
            fc | refs.oneOf."245" | { _ | Dyn } | optional,
            flexVolume | refs.oneOf."247" | { _ | Dyn } | optional,
            flocker | refs.oneOf."248" | { _ | Dyn } | optional,
            gcePersistentDisk | refs.oneOf."249" | { _ | Dyn } | optional,
            gitRepo | refs.oneOf."251" | { _ | Dyn } | optional,
            glusterfs | refs.oneOf."253" | { _ | Dyn } | optional,
            hostPath | refs.oneOf."258" | { _ | Dyn } | optional,
            image | refs.oneOf."261" | { _ | Dyn } | optional,
            iscsi | refs.oneOf."260" | { _ | Dyn } | optional,
            name | String,
            nfs | refs.oneOf."275" | { _ | Dyn } | optional,
            persistentVolumeClaim | refs.oneOf."308" | { _ | Dyn } | optional,
            photonPersistentDisk | refs.oneOf."312" | { _ | Dyn } | optional,
            portworxVolume | refs.oneOf."334" | { _ | Dyn } | optional,
            projected | refs.oneOf."337" | { _ | Dyn } | optional,
            quobyte | refs.oneOf."338" | { _ | Dyn } | optional,
            rbd | refs.oneOf."340" | { _ | Dyn } | optional,
            scaleIO | refs.oneOf."357" | { _ | Dyn } | optional,
            secret | refs.oneOf."367" | { _ | Dyn } | optional,
            storageos | refs.oneOf."380" | { _ | Dyn } | optional,
            vsphereVolume | refs.oneOf."397" | { _ | Dyn } | optional
          },
      oneOf."391" = { devicePath | String, name | String },
      oneOf."392" =
        {
            mountPath | String,
            mountPropagation | String | optional,
            name | String,
            readOnly | Bool | optional,
            recursiveReadOnly | String | optional,
            subPath | String | optional,
            subPathExpr | String | optional
          },
      oneOf."393" =
        {
            mountPath | String,
            name | String,
            readOnly | Bool | optional,
            recursiveReadOnly | String | optional
          },
      oneOf."394" = { required | refs.oneOf."292" | { _ | Dyn } | optional },
      oneOf."395" =
        {
            clusterTrustBundle | refs.oneOf."204" | { _ | Dyn } | optional,
            configMap | refs.oneOf."213" | { _ | Dyn } | optional,
            downwardAPI | refs.oneOf."226" | { _ | Dyn } | optional,
            secret | refs.oneOf."365" | { _ | Dyn } | optional,
            serviceAccountToken | refs.oneOf."372" | { _ | Dyn } | optional
          },
      oneOf."396" =
        {
            limits | { _ | refs.oneOf."672" } | optional,
            requests | { _ | refs.oneOf."672" } | optional
          },
      oneOf."397" =
        {
            fsType | String | optional,
            storagePolicyID | String | optional,
            storagePolicyName | String | optional,
            volumePath | String
          },
      oneOf."398" =
        {
            podAffinityTerm | refs.oneOf."315" | { _ | Dyn },
            weight | std.number.Integer
          },
      oneOf."399" =
        {
            gmsaCredentialSpec | String | optional,
            gmsaCredentialSpecName | String | optional,
            hostProcess | Bool | optional,
            runAsUserName | String | optional
          },
      oneOf."4" =
        {
            admissionReviewVersions | Array String,
            clientConfig | refs.oneOf."25" | { _ | Dyn },
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."2", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            name | String,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            reinvocationPolicy | String | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."10", { _ | Dyn } ])
              | optional,
            sideEffects | String,
            timeoutSeconds | std.number.Integer | optional
          },
      oneOf."40" = { expression | String, name | String },
      oneOf."400" =
        {
            addresses | Array String,
            conditions | refs.oneOf."401" | { _ | Dyn } | optional,
            deprecatedTopology | { _ | String } | optional,
            hints | refs.oneOf."402" | { _ | Dyn } | optional,
            hostname | String | optional,
            nodeName | String | optional,
            targetRef | refs.oneOf."300" | { _ | Dyn } | optional,
            zone | String | optional
          },
      oneOf."401" =
        {
            ready | Bool | optional,
            serving | Bool | optional,
            terminating | Bool | optional
          },
      oneOf."402" =
        {
            forNodes
              | Array (std.contract.Sequence [ refs.oneOf."406", { _ | Dyn } ])
              | optional,
            forZones
              | Array (std.contract.Sequence [ refs.oneOf."407", { _ | Dyn } ])
              | optional
          },
      oneOf."403" =
        {
            appProtocol | String | optional,
            name | String | optional,
            port | std.number.Integer | optional,
            protocol | String | optional
          },
      oneOf."404" =
        {
            addressType | String,
            apiVersion | String | optional,
            endpoints
              | Array (std.contract.Sequence [ refs.oneOf."400", { _ | Dyn } ]),
            kind | std.enum.TagOrString | [| 'EndpointSlice |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."403", { _ | Dyn } ])
              | optional
          },
      oneOf."406" = { name | String },
      oneOf."407" = { name | String },
      oneOf."408" =
        {
            action | String | optional,
            apiVersion | String | optional,
            deprecatedCount | std.number.Integer | optional,
            deprecatedFirstTimestamp | refs.oneOf."696" | String | optional,
            deprecatedLastTimestamp | refs.oneOf."696" | String | optional,
            deprecatedSource | refs.oneOf."243" | { _ | Dyn } | optional,
            eventTime | refs.oneOf."687" | String,
            kind | std.enum.TagOrString | [| 'Event |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            note | String | optional,
            reason | String | optional,
            regarding | refs.oneOf."300" | { _ | Dyn } | optional,
            related | refs.oneOf."300" | { _ | Dyn } | optional,
            reportingController | String | optional,
            reportingInstance | String | optional,
            series | refs.oneOf."410" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."41" = { key | String, valueExpression | String },
      oneOf."410" =
        {
            count | std.number.Integer,
            lastObservedTime | refs.oneOf."687" | String
          },
      oneOf."411" =
        {
            lendablePercent | std.number.Integer | optional,
            nominalConcurrencyShares | std.number.Integer | optional
          },
      oneOf."412" = { type | String },
      oneOf."413" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'FlowSchema |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."416" | { _ | Dyn } | optional,
            status | refs.oneOf."417" | { _ | Dyn } | optional
          },
      oneOf."414" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String | optional,
            type | String | optional
          },
      oneOf."416" =
        {
            distinguisherMethod | refs.oneOf."412" | { _ | Dyn } | optional,
            matchingPrecedence | std.number.Integer | optional,
            priorityLevelConfiguration | refs.oneOf."426" | { _ | Dyn },
            rules
              | Array (std.contract.Sequence [ refs.oneOf."422", { _ | Dyn } ])
              | optional
          },
      oneOf."417" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."414", { _ | Dyn } ])
              | optional
          },
      oneOf."418" = { name | String },
      oneOf."419" =
        { queuing | refs.oneOf."429" | { _ | Dyn } | optional, type | String },
      oneOf."42" = { fieldRef | String, warning | String },
      oneOf."420" =
        {
            borrowingLimitPercent | std.number.Integer | optional,
            lendablePercent | std.number.Integer | optional,
            limitResponse | refs.oneOf."419" | { _ | Dyn } | optional,
            nominalConcurrencyShares | std.number.Integer | optional
          },
      oneOf."421" = { nonResourceURLs | Array String, verbs | Array String },
      oneOf."422" =
        {
            nonResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."421", { _ | Dyn } ])
              | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."430", { _ | Dyn } ])
              | optional,
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."432", { _ | Dyn } ])
          },
      oneOf."423" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'PriorityLevelConfiguration |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."427" | { _ | Dyn } | optional,
            status | refs.oneOf."428" | { _ | Dyn } | optional
          },
      oneOf."424" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String | optional,
            type | String | optional
          },
      oneOf."426" = { name | String },
      oneOf."427" =
        {
            exempt | refs.oneOf."411" | { _ | Dyn } | optional,
            limited | refs.oneOf."420" | { _ | Dyn } | optional,
            type | String
          },
      oneOf."428" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."424", { _ | Dyn } ])
              | optional
          },
      oneOf."429" =
        {
            handSize | std.number.Integer | optional,
            queueLengthLimit | std.number.Integer | optional,
            queues | std.number.Integer | optional
          },
      oneOf."43" = { expression | String, name | String },
      oneOf."430" =
        {
            apiGroups | Array String,
            clusterScope | Bool | optional,
            namespaces | Array String | optional,
            resources | Array String,
            verbs | Array String
          },
      oneOf."431" = { name | String, namespace | String },
      oneOf."432" =
        {
            group | refs.oneOf."418" | { _ | Dyn } | optional,
            kind | String,
            serviceAccount | refs.oneOf."431" | { _ | Dyn } | optional,
            user | refs.oneOf."433" | { _ | Dyn } | optional
          },
      oneOf."433" = { name | String },
      oneOf."434" =
        {
            backend | refs.oneOf."441" | { _ | Dyn },
            path | String | optional,
            pathType | String
          },
      oneOf."435" =
        {
            paths
              | Array (std.contract.Sequence [ refs.oneOf."434", { _ | Dyn } ])
          },
      oneOf."436" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IPAddress |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."438" | { _ | Dyn } | optional
          },
      oneOf."438" = { parentRef | refs.oneOf."462" | { _ | Dyn } },
      oneOf."439" = { cidr | String, except | Array String | optional },
      oneOf."44" =
        {
            excludeResourceRules
              | Array (std.contract.Sequence [ refs.oneOf."45", { _ | Dyn } ])
              | optional,
            matchPolicy | String | optional,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            objectSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            resourceRules
              | Array (std.contract.Sequence [ refs.oneOf."45", { _ | Dyn } ])
              | optional
          },
      oneOf."440" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Ingress |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."452" | { _ | Dyn } | optional,
            status | refs.oneOf."453" | { _ | Dyn } | optional
          },
      oneOf."441" =
        {
            resource | refs.oneOf."388" | { _ | Dyn } | optional,
            service | refs.oneOf."451" | { _ | Dyn } | optional
          },
      oneOf."442" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IngressClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."445" | { _ | Dyn } | optional
          },
      oneOf."444" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional,
            scope | String | optional
          },
      oneOf."445" =
        {
            controller | String | optional,
            parameters | refs.oneOf."444" | { _ | Dyn } | optional
          },
      oneOf."447" =
        {
            hostname | String | optional,
            ip | String | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."449", { _ | Dyn } ])
              | optional
          },
      oneOf."448" =
        {
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."447", { _ | Dyn } ])
              | optional
          },
      oneOf."449" =
        {
            error | String | optional,
            port | std.number.Integer,
            protocol | String
          },
      oneOf."45" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."450" =
        {
            host | String | optional,
            http | refs.oneOf."435" | { _ | Dyn } | optional
          },
      oneOf."451" =
        { name | String, port | refs.oneOf."463" | { _ | Dyn } | optional },
      oneOf."452" =
        {
            defaultBackend | refs.oneOf."441" | { _ | Dyn } | optional,
            ingressClassName | String | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."450", { _ | Dyn } ])
              | optional,
            tls
              | Array (std.contract.Sequence [ refs.oneOf."454", { _ | Dyn } ])
              | optional
          },
      oneOf."453" =
        { loadBalancer | refs.oneOf."448" | { _ | Dyn } | optional },
      oneOf."454" =
        { hosts | Array String | optional, secretName | String | optional },
      oneOf."455" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'NetworkPolicy |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."461" | { _ | Dyn } | optional
          },
      oneOf."456" =
        {
            ports
              | Array (std.contract.Sequence [ refs.oneOf."460", { _ | Dyn } ])
              | optional,
            to
              | Array (std.contract.Sequence [ refs.oneOf."459", { _ | Dyn } ])
              | optional
          },
      oneOf."457" =
        {
            from
              | Array (std.contract.Sequence [ refs.oneOf."459", { _ | Dyn } ])
              | optional,
            ports
              | Array (std.contract.Sequence [ refs.oneOf."460", { _ | Dyn } ])
              | optional
          },
      oneOf."459" =
        {
            ipBlock | refs.oneOf."439" | { _ | Dyn } | optional,
            namespaceSelector | refs.oneOf."683" | { _ | Dyn } | optional,
            podSelector | refs.oneOf."683" | { _ | Dyn } | optional
          },
      oneOf."46" = { apiVersion | String | optional, kind | String | optional },
      oneOf."460" =
        {
            endPort | std.number.Integer | optional,
            port | refs.oneOf."699" | optional,
            protocol | String | optional
          },
      oneOf."461" =
        {
            egress
              | Array (std.contract.Sequence [ refs.oneOf."456", { _ | Dyn } ])
              | optional,
            ingress
              | Array (std.contract.Sequence [ refs.oneOf."457", { _ | Dyn } ])
              | optional,
            podSelector | refs.oneOf."683" | { _ | Dyn },
            policyTypes | Array String | optional
          },
      oneOf."462" =
        {
            group | String | optional,
            name | String,
            namespace | String | optional,
            resource | String
          },
      oneOf."463" =
        { name | String | optional, number | std.number.Integer | optional },
      oneOf."464" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ServiceCIDR |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."466" | { _ | Dyn } | optional,
            status | refs.oneOf."467" | { _ | Dyn } | optional
          },
      oneOf."466" = { cidrs | Array String | optional },
      oneOf."467" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional
          },
      oneOf."468" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'IPAddress |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."470" | { _ | Dyn } | optional
          },
      oneOf."47" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."683" | { _ | Dyn } | optional
          },
      oneOf."470" = { parentRef | refs.oneOf."471" | { _ | Dyn } },
      oneOf."471" =
        {
            group | String | optional,
            name | String,
            namespace | String | optional,
            resource | String
          },
      oneOf."472" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ServiceCIDR |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."474" | { _ | Dyn } | optional,
            status | refs.oneOf."475" | { _ | Dyn } | optional
          },
      oneOf."474" = { cidrs | Array String | optional },
      oneOf."475" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional
          },
      oneOf."476" = { podFixed | { _ | refs.oneOf."672" } | optional },
      oneOf."477" =
        {
            apiVersion | String | optional,
            handler | String,
            kind | std.enum.TagOrString | [| 'RuntimeClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            overhead | refs.oneOf."476" | { _ | Dyn } | optional,
            scheduling | refs.oneOf."479" | { _ | Dyn } | optional
          },
      oneOf."479" =
        {
            nodeSelector | { _ | String } | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."384", { _ | Dyn } ])
              | optional
          },
      oneOf."48" =
        {
            expressionWarnings
              | Array (std.contract.Sequence [ refs.oneOf."42", { _ | Dyn } ])
              | optional
          },
      oneOf."481" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'PodDisruptionBudget |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."483" | { _ | Dyn } | optional,
            status | refs.oneOf."484" | { _ | Dyn } | optional
          },
      oneOf."483" =
        {
            maxUnavailable | refs.oneOf."699" | optional,
            minAvailable | refs.oneOf."699" | optional,
            selector | refs.oneOf."683" | { _ | Dyn } | optional,
            unhealthyPodEvictionPolicy | String | optional
          },
      oneOf."484" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            currentHealthy | std.number.Integer,
            desiredHealthy | std.number.Integer,
            disruptedPods
              | { _ | std.contract.Sequence [ refs.oneOf."696", String ] }
              | optional,
            disruptionsAllowed | std.number.Integer,
            expectedPods | std.number.Integer,
            observedGeneration | std.number.Integer | optional
          },
      oneOf."485" =
        {
            clusterRoleSelectors
              | Array (std.contract.Sequence [ refs.oneOf."683", { _ | Dyn } ])
              | optional
          },
      oneOf."486" =
        {
            aggregationRule | refs.oneOf."485" | { _ | Dyn } | optional,
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterRole |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."490", { _ | Dyn } ])
              | optional
          },
      oneOf."487" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ClusterRoleBinding |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            roleRef | refs.oneOf."495" | { _ | Dyn },
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."496", { _ | Dyn } ])
              | optional
          },
      oneOf."49" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicy |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."54" | { _ | Dyn } | optional,
            status | refs.oneOf."55" | { _ | Dyn } | optional
          },
      oneOf."490" =
        {
            apiGroups | Array String | optional,
            nonResourceURLs | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            verbs | Array String
          },
      oneOf."491" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Role |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            rules
              | Array (std.contract.Sequence [ refs.oneOf."490", { _ | Dyn } ])
              | optional
          },
      oneOf."492" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'RoleBinding |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            roleRef | refs.oneOf."495" | { _ | Dyn },
            subjects
              | Array (std.contract.Sequence [ refs.oneOf."496", { _ | Dyn } ])
              | optional
          },
      oneOf."495" = { apiGroup | String, kind | String, name | String },
      oneOf."496" =
        {
            apiGroup | String | optional,
            kind | String,
            name | String,
            namespace | String | optional
          },
      oneOf."497" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."698" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."525" | { _ | Dyn } | optional,
            pool | String
          },
      oneOf."498" =
        {
            devices | refs.oneOf."505" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional
          },
      oneOf."499" =
        {
            allNodes | Bool | optional,
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."506", { _ | Dyn } ] }
              | optional,
            capacity | { _ | refs.oneOf."672" } | optional,
            consumesCounters
              | Array (std.contract.Sequence [ refs.oneOf."514", { _ | Dyn } ])
              | optional,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."519", { _ | Dyn } ])
              | optional
          },
      oneOf."5" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'MutatingWebhookConfiguration |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            webhooks
              | Array (std.contract.Sequence [ refs.oneOf."4", { _ | Dyn } ])
              | optional
          },
      oneOf."50" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ValidatingAdmissionPolicyBinding |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."52" | { _ | Dyn } | optional
          },
      oneOf."500" = { expression | String },
      oneOf."501" = { value | refs.oneOf."672" },
      oneOf."502" =
        {
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."501", { _ | Dyn } ] },
            name | String
          },
      oneOf."503" =
        { basic | refs.oneOf."499" | { _ | Dyn } | optional, name | String },
      oneOf."504" =
        {
            opaque | refs.oneOf."526" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."505" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."504", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."516", { _ | Dyn } ])
              | optional
          },
      oneOf."506" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."507" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."508", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."513", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."515", { _ | Dyn } ])
              | optional
          },
      oneOf."508" =
        {
            opaque | refs.oneOf."526" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."509" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."512" | { _ | Dyn }
          },
      oneOf."510" = { opaque | refs.oneOf."526" | { _ | Dyn } | optional },
      oneOf."512" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."510", { _ | Dyn } ])
              | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."517", { _ | Dyn } ])
              | optional
          },
      oneOf."513" =
        {
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."514" =
        {
            counterSet | String,
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."501", { _ | Dyn } ] }
          },
      oneOf."515" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String | optional,
            firstAvailable
              | Array (std.contract.Sequence [ refs.oneOf."518", { _ | Dyn } ])
              | optional,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."517", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."524", { _ | Dyn } ])
              | optional
          },
      oneOf."516" =
        {
            adminAccess | Bool | optional,
            device | String,
            driver | String,
            pool | String,
            request | String,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."524", { _ | Dyn } ])
              | optional
          },
      oneOf."517" = { cel | refs.oneOf."500" | { _ | Dyn } | optional },
      oneOf."518" =
        {
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."517", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."524", { _ | Dyn } ])
              | optional
          },
      oneOf."519" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."696" | String | optional,
            value | String | optional
          },
      oneOf."52" =
        {
            matchResources | refs.oneOf."44" | { _ | Dyn } | optional,
            paramRef | refs.oneOf."47" | { _ | Dyn } | optional,
            policyName | String | optional,
            validationActions | Array String | optional
          },
      oneOf."520" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceTaintRule |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."522" | { _ | Dyn }
          },
      oneOf."522" =
        {
            deviceSelector | refs.oneOf."523" | { _ | Dyn } | optional,
            taint | refs.oneOf."519" | { _ | Dyn }
          },
      oneOf."523" =
        {
            device | String | optional,
            deviceClassName | String | optional,
            driver | String | optional,
            pool | String | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."517", { _ | Dyn } ])
              | optional
          },
      oneOf."524" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."525" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."526" =
        { driver | String, parameters | refs.oneOf."698" | { _ | Dyn } },
      oneOf."527" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."530" | { _ | Dyn },
            status | refs.oneOf."531" | { _ | Dyn } | optional
          },
      oneOf."528" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."530" = { devices | refs.oneOf."507" | { _ | Dyn } | optional },
      oneOf."531" =
        {
            allocation | refs.oneOf."498" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."497", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."528", { _ | Dyn } ])
              | optional
          },
      oneOf."532" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."534" | { _ | Dyn }
          },
      oneOf."534" =
        {
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."530" | { _ | Dyn }
          },
      oneOf."535" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."536" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."538" | { _ | Dyn }
          },
      oneOf."538" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."503", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional,
            perDeviceNodeSelection | Bool | optional,
            pool | refs.oneOf."535" | { _ | Dyn },
            sharedCounters
              | Array (std.contract.Sequence [ refs.oneOf."502", { _ | Dyn } ])
              | optional
          },
      oneOf."539" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."698" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."564" | { _ | Dyn } | optional,
            pool | String
          },
      oneOf."54" =
        {
            auditAnnotations
              | Array (std.contract.Sequence [ refs.oneOf."41", { _ | Dyn } ])
              | optional,
            failurePolicy | String | optional,
            matchConditions
              | Array (std.contract.Sequence [ refs.oneOf."43", { _ | Dyn } ])
              | optional,
            matchConstraints | refs.oneOf."44" | { _ | Dyn } | optional,
            paramKind | refs.oneOf."46" | { _ | Dyn } | optional,
            validations
              | Array (std.contract.Sequence [ refs.oneOf."56", { _ | Dyn } ])
              | optional,
            variables
              | Array (std.contract.Sequence [ refs.oneOf."57", { _ | Dyn } ])
              | optional
          },
      oneOf."540" =
        {
            devices | refs.oneOf."547" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional
          },
      oneOf."541" =
        {
            allNodes | Bool | optional,
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."548", { _ | Dyn } ] }
              | optional,
            capacity
              | { _ | std.contract.Sequence [ refs.oneOf."549", { _ | Dyn } ] }
              | optional,
            consumesCounters
              | Array (std.contract.Sequence [ refs.oneOf."557", { _ | Dyn } ])
              | optional,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."562", { _ | Dyn } ])
              | optional
          },
      oneOf."542" = { expression | String },
      oneOf."543" = { value | refs.oneOf."672" },
      oneOf."544" =
        {
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."543", { _ | Dyn } ] },
            name | String
          },
      oneOf."545" =
        { basic | refs.oneOf."541" | { _ | Dyn } | optional, name | String },
      oneOf."546" =
        {
            opaque | refs.oneOf."565" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."547" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."546", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."559", { _ | Dyn } ])
              | optional
          },
      oneOf."548" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."549" = { value | refs.oneOf."672" },
      oneOf."55" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            typeChecking | refs.oneOf."48" | { _ | Dyn } | optional
          },
      oneOf."550" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."551", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."556", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."558", { _ | Dyn } ])
              | optional
          },
      oneOf."551" =
        {
            opaque | refs.oneOf."565" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."552" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."555" | { _ | Dyn }
          },
      oneOf."553" = { opaque | refs.oneOf."565" | { _ | Dyn } | optional },
      oneOf."555" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."553", { _ | Dyn } ])
              | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."560", { _ | Dyn } ])
              | optional
          },
      oneOf."556" =
        {
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."557" =
        {
            counterSet | String,
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."543", { _ | Dyn } ] }
          },
      oneOf."558" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String | optional,
            firstAvailable
              | Array (std.contract.Sequence [ refs.oneOf."561", { _ | Dyn } ])
              | optional,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."560", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."563", { _ | Dyn } ])
              | optional
          },
      oneOf."559" =
        {
            adminAccess | Bool | optional,
            device | String,
            driver | String,
            pool | String,
            request | String,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."563", { _ | Dyn } ])
              | optional
          },
      oneOf."56" =
        {
            expression | String,
            message | String | optional,
            messageExpression | String | optional,
            reason | String | optional
          },
      oneOf."560" = { cel | refs.oneOf."542" | { _ | Dyn } | optional },
      oneOf."561" =
        {
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."560", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."563", { _ | Dyn } ])
              | optional
          },
      oneOf."562" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."696" | String | optional,
            value | String | optional
          },
      oneOf."563" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."564" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."565" =
        { driver | String, parameters | refs.oneOf."698" | { _ | Dyn } },
      oneOf."566" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."569" | { _ | Dyn },
            status | refs.oneOf."570" | { _ | Dyn } | optional
          },
      oneOf."567" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."569" = { devices | refs.oneOf."550" | { _ | Dyn } | optional },
      oneOf."57" = { expression | String, name | String },
      oneOf."570" =
        {
            allocation | refs.oneOf."540" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."539", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."567", { _ | Dyn } ])
              | optional
          },
      oneOf."571" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."573" | { _ | Dyn }
          },
      oneOf."573" =
        {
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."569" | { _ | Dyn }
          },
      oneOf."574" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."575" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."577" | { _ | Dyn }
          },
      oneOf."577" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."545", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional,
            perDeviceNodeSelection | Bool | optional,
            pool | refs.oneOf."574" | { _ | Dyn },
            sharedCounters
              | Array (std.contract.Sequence [ refs.oneOf."544", { _ | Dyn } ])
              | optional
          },
      oneOf."578" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."678", { _ | Dyn } ])
              | optional,
            data | refs.oneOf."698" | { _ | Dyn } | optional,
            device | String,
            driver | String,
            networkData | refs.oneOf."603" | { _ | Dyn } | optional,
            pool | String
          },
      oneOf."579" =
        {
            devices | refs.oneOf."585" | { _ | Dyn } | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional
          },
      oneOf."58" =
        {
            apiServerID | String | optional,
            decodableVersions | Array String | optional,
            encodingVersion | String | optional,
            servedVersions | Array String | optional
          },
      oneOf."580" = { expression | String },
      oneOf."581" = { value | refs.oneOf."672" },
      oneOf."582" =
        {
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."581", { _ | Dyn } ] },
            name | String
          },
      oneOf."583" =
        {
            allNodes | Bool | optional,
            attributes
              | { _ | std.contract.Sequence [ refs.oneOf."586", { _ | Dyn } ] }
              | optional,
            capacity
              | { _ | std.contract.Sequence [ refs.oneOf."587", { _ | Dyn } ] }
              | optional,
            consumesCounters
              | Array (std.contract.Sequence [ refs.oneOf."595", { _ | Dyn } ])
              | optional,
            name | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional,
            taints
              | Array (std.contract.Sequence [ refs.oneOf."600", { _ | Dyn } ])
              | optional
          },
      oneOf."584" =
        {
            opaque | refs.oneOf."604" | { _ | Dyn } | optional,
            requests | Array String | optional,
            source | String
          },
      oneOf."585" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."584", { _ | Dyn } ])
              | optional,
            results
              | Array (std.contract.Sequence [ refs.oneOf."597", { _ | Dyn } ])
              | optional
          },
      oneOf."586" =
        {
            bool | Bool | optional,
            int | std.number.Integer | optional,
            string | String | optional,
            version | String | optional
          },
      oneOf."587" = { value | refs.oneOf."672" },
      oneOf."588" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."589", { _ | Dyn } ])
              | optional,
            constraints
              | Array (std.contract.Sequence [ refs.oneOf."594", { _ | Dyn } ])
              | optional,
            requests
              | Array (std.contract.Sequence [ refs.oneOf."596", { _ | Dyn } ])
              | optional
          },
      oneOf."589" =
        {
            opaque | refs.oneOf."604" | { _ | Dyn } | optional,
            requests | Array String | optional
          },
      oneOf."59" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StorageVersion |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."62" | { _ | Dyn },
            status | refs.oneOf."63" | { _ | Dyn }
          },
      oneOf."590" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DeviceClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."593" | { _ | Dyn }
          },
      oneOf."591" = { opaque | refs.oneOf."604" | { _ | Dyn } | optional },
      oneOf."593" =
        {
            config
              | Array (std.contract.Sequence [ refs.oneOf."591", { _ | Dyn } ])
              | optional,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."598", { _ | Dyn } ])
              | optional
          },
      oneOf."594" =
        {
            matchAttribute | String | optional,
            requests | Array String | optional
          },
      oneOf."595" =
        {
            counterSet | String,
            counters
              | { _ | std.contract.Sequence [ refs.oneOf."581", { _ | Dyn } ] }
          },
      oneOf."596" =
        {
            exactly | refs.oneOf."602" | { _ | Dyn } | optional,
            firstAvailable
              | Array (std.contract.Sequence [ refs.oneOf."599", { _ | Dyn } ])
              | optional,
            name | String
          },
      oneOf."597" =
        {
            adminAccess | Bool | optional,
            device | String,
            driver | String,
            pool | String,
            request | String,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."601", { _ | Dyn } ])
              | optional
          },
      oneOf."598" = { cel | refs.oneOf."580" | { _ | Dyn } | optional },
      oneOf."599" =
        {
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            name | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."598", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."601", { _ | Dyn } ])
              | optional
          },
      oneOf."60" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String,
            observedGeneration | std.number.Integer | optional,
            reason | String,
            status | String,
            type | String
          },
      oneOf."600" =
        {
            effect | String,
            key | String,
            timeAdded | refs.oneOf."696" | String | optional,
            value | String | optional
          },
      oneOf."601" =
        {
            effect | String | optional,
            key | String | optional,
            operator | String | optional,
            tolerationSeconds | std.number.Integer | optional,
            value | String | optional
          },
      oneOf."602" =
        {
            adminAccess | Bool | optional,
            allocationMode | String | optional,
            count | std.number.Integer | optional,
            deviceClassName | String,
            selectors
              | Array (std.contract.Sequence [ refs.oneOf."598", { _ | Dyn } ])
              | optional,
            tolerations
              | Array (std.contract.Sequence [ refs.oneOf."601", { _ | Dyn } ])
              | optional
          },
      oneOf."603" =
        {
            hardwareAddress | String | optional,
            interfaceName | String | optional,
            ips | Array String | optional
          },
      oneOf."604" =
        { driver | String, parameters | refs.oneOf."698" | { _ | Dyn } },
      oneOf."605" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceClaim |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."608" | { _ | Dyn },
            status | refs.oneOf."609" | { _ | Dyn } | optional
          },
      oneOf."606" =
        {
            apiGroup | String | optional,
            name | String,
            resource | String,
            uid | String
          },
      oneOf."608" = { devices | refs.oneOf."588" | { _ | Dyn } | optional },
      oneOf."609" =
        {
            allocation | refs.oneOf."579" | { _ | Dyn } | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."578", { _ | Dyn } ])
              | optional,
            reservedFor
              | Array (std.contract.Sequence [ refs.oneOf."606", { _ | Dyn } ])
              | optional
          },
      oneOf."610" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'ResourceClaimTemplate |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."612" | { _ | Dyn }
          },
      oneOf."612" =
        {
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."608" | { _ | Dyn }
          },
      oneOf."613" =
        {
            generation | std.number.Integer,
            name | String,
            resourceSliceCount | std.number.Integer
          },
      oneOf."614" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ResourceSlice |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."616" | { _ | Dyn }
          },
      oneOf."616" =
        {
            allNodes | Bool | optional,
            devices
              | Array (std.contract.Sequence [ refs.oneOf."583", { _ | Dyn } ])
              | optional,
            driver | String,
            nodeName | String | optional,
            nodeSelector | refs.oneOf."292" | { _ | Dyn } | optional,
            perDeviceNodeSelection | Bool | optional,
            pool | refs.oneOf."613" | { _ | Dyn },
            sharedCounters
              | Array (std.contract.Sequence [ refs.oneOf."582", { _ | Dyn } ])
              | optional
          },
      oneOf."617" =
        {
            apiVersion | String | optional,
            description | String | optional,
            globalDefault | Bool | optional,
            kind | std.enum.TagOrString | [| 'PriorityClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            preemptionPolicy | String | optional,
            value | std.number.Integer
          },
      oneOf."619" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CSIDriver |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."621" | { _ | Dyn }
          },
      oneOf."62" = { _ | Dyn },
      oneOf."621" =
        {
            attachRequired | Bool | optional,
            fsGroupPolicy | String | optional,
            nodeAllocatableUpdatePeriodSeconds | std.number.Integer | optional,
            podInfoOnMount | Bool | optional,
            requiresRepublish | Bool | optional,
            seLinuxMount | Bool | optional,
            storageCapacity | Bool | optional,
            tokenRequests
              | Array (std.contract.Sequence [ refs.oneOf."630", { _ | Dyn } ])
              | optional,
            volumeLifecycleModes | Array String | optional
          },
      oneOf."622" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'CSINode |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."625" | { _ | Dyn }
          },
      oneOf."623" =
        {
            allocatable | refs.oneOf."637" | { _ | Dyn } | optional,
            name | String,
            nodeID | String,
            topologyKeys | Array String | optional
          },
      oneOf."625" =
        {
            drivers
              | Array (std.contract.Sequence [ refs.oneOf."623", { _ | Dyn } ])
          },
      oneOf."626" =
        {
            apiVersion | String | optional,
            capacity | refs.oneOf."672" | optional,
            kind | std.enum.TagOrString | [| 'CSIStorageCapacity |] | optional,
            maximumVolumeSize | refs.oneOf."672" | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            nodeTopology | refs.oneOf."683" | { _ | Dyn } | optional,
            storageClassName | String
          },
      oneOf."628" =
        {
            allowVolumeExpansion | Bool | optional,
            allowedTopologies
              | Array (std.contract.Sequence [ refs.oneOf."386", { _ | Dyn } ])
              | optional,
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StorageClass |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            mountOptions | Array String | optional,
            parameters | { _ | String } | optional,
            provisioner | String,
            reclaimPolicy | String | optional,
            volumeBindingMode | String | optional
          },
      oneOf."63" =
        {
            commonEncodingVersion | String | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."60", { _ | Dyn } ])
              | optional,
            storageVersions
              | Array (std.contract.Sequence [ refs.oneOf."58", { _ | Dyn } ])
              | optional
          },
      oneOf."630" =
        {
            audience | String,
            expirationSeconds | std.number.Integer | optional
          },
      oneOf."631" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'VolumeAttachment |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."634" | { _ | Dyn },
            status | refs.oneOf."635" | { _ | Dyn } | optional
          },
      oneOf."633" =
        {
            inlineVolumeSpec | refs.oneOf."310" | { _ | Dyn } | optional,
            persistentVolumeName | String | optional
          },
      oneOf."634" =
        {
            attacher | String,
            nodeName | String,
            source | refs.oneOf."633" | { _ | Dyn }
          },
      oneOf."635" =
        {
            attachError | refs.oneOf."636" | { _ | Dyn } | optional,
            attached | Bool,
            attachmentMetadata | { _ | String } | optional,
            detachError | refs.oneOf."636" | { _ | Dyn } | optional
          },
      oneOf."636" =
        {
            errorCode | std.number.Integer | optional,
            message | String | optional,
            time | refs.oneOf."696" | String | optional
          },
      oneOf."637" = { count | std.number.Integer | optional },
      oneOf."638" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."64" =
        {
            apiVersion | String | optional,
            data | refs.oneOf."698" | { _ | Dyn } | optional,
            kind | std.enum.TagOrString | [| 'ControllerRevision |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            revision | std.number.Integer
          },
      oneOf."640" =
        {
            apiVersion | String | optional,
            driverName | String,
            kind
              | std.enum.TagOrString
              | [| 'VolumeAttributesClass |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            parameters | { _ | String } | optional
          },
      oneOf."642" =
        {
            group | String | optional,
            resource | String | optional,
            version | String | optional
          },
      oneOf."643" =
        {
            lastUpdateTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."644" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'StorageVersionMigration |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."646" | { _ | Dyn } | optional,
            status | refs.oneOf."647" | { _ | Dyn } | optional
          },
      oneOf."646" =
        {
            continueToken | String | optional,
            resource | refs.oneOf."642" | { _ | Dyn }
          },
      oneOf."647" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."643", { _ | Dyn } ])
              | optional,
            resourceVersion | String | optional
          },
      oneOf."648" =
        {
            description | String | optional,
            format | String | optional,
            jsonPath | String,
            name | String,
            "priority" | std.number.Integer | optional,
            type | String
          },
      oneOf."649" =
        {
            strategy | String,
            webhook | refs.oneOf."671" | { _ | Dyn } | optional
          },
      oneOf."650" =
        {
            apiVersion | String | optional,
            kind
              | std.enum.TagOrString
              | [| 'CustomResourceDefinition |]
              | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."654" | { _ | Dyn },
            status | refs.oneOf."655" | { _ | Dyn } | optional
          },
      oneOf."651" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."653" =
        {
            categories | Array String | optional,
            kind | String,
            listKind | String | optional,
            plural | String,
            shortNames | Array String | optional,
            singular | String | optional
          },
      oneOf."654" =
        {
            conversion | refs.oneOf."649" | { _ | Dyn } | optional,
            group | String,
            names | refs.oneOf."653" | { _ | Dyn },
            preserveUnknownFields | Bool | optional,
            scope | String,
            versions
              | Array (std.contract.Sequence [ refs.oneOf."656", { _ | Dyn } ])
          },
      oneOf."655" =
        {
            acceptedNames | refs.oneOf."653" | { _ | Dyn } | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."651", { _ | Dyn } ])
              | optional,
            storedVersions | Array String | optional
          },
      oneOf."656" =
        {
            additionalPrinterColumns
              | Array (std.contract.Sequence [ refs.oneOf."648", { _ | Dyn } ])
              | optional,
            deprecated | Bool | optional,
            deprecationWarning | String | optional,
            name | String,
            schema | refs.oneOf."660" | { _ | Dyn } | optional,
            selectableFields
              | Array (std.contract.Sequence [ refs.oneOf."667", { _ | Dyn } ])
              | optional,
            served | Bool,
            storage | Bool,
            subresources | refs.oneOf."659" | { _ | Dyn } | optional
          },
      oneOf."657" =
        {
            labelSelectorPath | String | optional,
            specReplicasPath | String,
            statusReplicasPath | String
          },
      oneOf."658" = { _ | Dyn },
      oneOf."659" =
        {
            scale | refs.oneOf."657" | { _ | Dyn } | optional,
            status | refs.oneOf."658" | { _ | Dyn } | optional
          },
      oneOf."66" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'DaemonSet |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."69" | { _ | Dyn } | optional,
            status | refs.oneOf."70" | { _ | Dyn } | optional
          },
      oneOf."660" =
        { openAPIV3Schema | refs.oneOf."663" | { _ | Dyn } | optional },
      oneOf."661" =
        { description | String | optional, url | String | optional },
      oneOf."662" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."663" =
        {
            "$ref" | String | optional,
            "$schema" | String | optional,
            additionalItems | refs.oneOf."665" | optional,
            additionalProperties | refs.oneOf."665" | optional,
            allOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            anyOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            "default" | refs.oneOf."662" | optional,
            definitions
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            dependencies | { _ | refs.oneOf."666" } | optional,
            description | String | optional,
            enum | Array refs.oneOf."662" | optional,
            example | refs.oneOf."662" | optional,
            exclusiveMaximum | Bool | optional,
            exclusiveMinimum | Bool | optional,
            externalDocs | refs.oneOf."661" | { _ | Dyn } | optional,
            format | String | optional,
            id | String | optional,
            items | refs.oneOf."664" | optional,
            maxItems | std.number.Integer | optional,
            maxLength | std.number.Integer | optional,
            maxProperties | std.number.Integer | optional,
            maximum | Number | optional,
            minItems | std.number.Integer | optional,
            minLength | std.number.Integer | optional,
            minProperties | std.number.Integer | optional,
            minimum | Number | optional,
            multipleOf | Number | optional,
            not | js2n.Always | { _ | Dyn } | optional,
            nullable | Bool | optional,
            oneOf
              | Array (std.contract.Sequence [ js2n.Always, { _ | Dyn } ])
              | optional,
            pattern | String | optional,
            patternProperties
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            properties
              | { _ | std.contract.Sequence [ js2n.Always, { _ | Dyn } ] }
              | optional,
            required | Array String | optional,
            title | String | optional,
            type | String | optional,
            uniqueItems | Bool | optional,
            x-kubernetes-embedded-resource | Bool | optional,
            x-kubernetes-int-or-string | Bool | optional,
            x-kubernetes-list-map-keys | Array String | optional,
            x-kubernetes-list-type | String | optional,
            x-kubernetes-map-type | String | optional,
            x-kubernetes-preserve-unknown-fields | Bool | optional,
            x-kubernetes-validations
              | Array (std.contract.Sequence [ refs.oneOf."669", { _ | Dyn } ])
              | optional
          },
      oneOf."664" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."665" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."666" =
        std.contract.any_of
            [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
      oneOf."667" = { jsonPath | String },
      oneOf."668" =
        {
            name | String,
            namespace | String,
            path | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."669" =
        {
            fieldPath | String | optional,
            message | String | optional,
            messageExpression | String | optional,
            optionalOldSelf | Bool | optional,
            reason | String | optional,
            rule | String
          },
      oneOf."67" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."670" =
        {
            caBundle | String | optional,
            service | refs.oneOf."668" | { _ | Dyn } | optional,
            url | String | optional
          },
      oneOf."671" =
        {
            clientConfig | refs.oneOf."670" | { _ | Dyn } | optional,
            conversionReviewVersions | Array String
          },
      oneOf."672" = std.contract.any_of [ Number, String ],
      oneOf."673" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'APIGroup |] | optional,
            name | String,
            preferredVersion | refs.oneOf."682" | { _ | Dyn } | optional,
            serverAddressByClientCIDRs
              | Array (std.contract.Sequence [ refs.oneOf."692", { _ | Dyn } ])
              | optional,
            versions
              | Array (std.contract.Sequence [ refs.oneOf."682", { _ | Dyn } ])
          },
      oneOf."675" =
        {
            categories | Array String | optional,
            group | String | optional,
            kind | String,
            name | String,
            namespaced | Bool,
            shortNames | Array String | optional,
            singularName | String,
            storageVersionHash | String | optional,
            verbs | Array String,
            version | String | optional
          },
      oneOf."678" =
        {
            lastTransitionTime | refs.oneOf."696" | String,
            message | String,
            observedGeneration | std.number.Integer | optional,
            reason | String,
            status | String,
            type | String
          },
      oneOf."679" =
        {
            apiVersion | String | optional,
            dryRun | Array String | optional,
            gracePeriodSeconds | std.number.Integer | optional,
            ignoreStoreReadErrorWithClusterBreakingPotential | Bool | optional,
            kind | std.enum.TagOrString | [| 'DeleteOptions |] | optional,
            orphanDependents | Bool | optional,
            preconditions | refs.oneOf."691" | { _ | Dyn } | optional,
            propagationPolicy | String | optional
          },
      oneOf."680" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."681" = { _ | Dyn },
      oneOf."682" = { groupVersion | String, version | String },
      oneOf."683" =
        {
            matchExpressions
              | Array (std.contract.Sequence [ refs.oneOf."684", { _ | Dyn } ])
              | optional,
            matchLabels | { _ | String } | optional
          },
      oneOf."684" =
        { key | String, operator | String, values | Array String | optional },
      oneOf."685" =
        {
            continue | String | optional,
            remainingItemCount | std.number.Integer | optional,
            resourceVersion | String | optional,
            selfLink | String | optional
          },
      oneOf."686" =
        {
            apiVersion | String | optional,
            fieldsType | String | optional,
            fieldsV1 | refs.oneOf."681" | { _ | Dyn } | optional,
            manager | String | optional,
            operation | String | optional,
            subresource | String | optional,
            time | refs.oneOf."696" | String | optional
          },
      oneOf."687" = String,
      oneOf."688" =
        {
            annotations | { _ | String } | optional,
            creationTimestamp | refs.oneOf."696" | String | optional,
            deletionGracePeriodSeconds | std.number.Integer | optional,
            deletionTimestamp | refs.oneOf."696" | String | optional,
            finalizers | Array String | optional,
            generateName | String | optional,
            generation | std.number.Integer | optional,
            labels | { _ | String } | optional,
            managedFields
              | Array (std.contract.Sequence [ refs.oneOf."686", { _ | Dyn } ])
              | optional,
            name | String | optional,
            namespace | String | optional,
            ownerReferences
              | Array (std.contract.Sequence [ refs.oneOf."689", { _ | Dyn } ])
              | optional,
            resourceVersion | String | optional,
            selfLink | String | optional,
            uid | String | optional
          },
      oneOf."689" =
        {
            apiVersion | String,
            blockOwnerDeletion | Bool | optional,
            controller | Bool | optional,
            kind | String,
            name | String,
            uid | String
          },
      oneOf."69" =
        {
            minReadySeconds | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."683" | { _ | Dyn },
            template | refs.oneOf."332" | { _ | Dyn },
            updateStrategy | refs.oneOf."71" | { _ | Dyn } | optional
          },
      oneOf."691" =
        { resourceVersion | String | optional, uid | String | optional },
      oneOf."692" = { clientCIDR | String, serverAddress | String },
      oneOf."694" =
        {
            field | String | optional,
            message | String | optional,
            reason | String | optional
          },
      oneOf."695" =
        {
            causes
              | Array (std.contract.Sequence [ refs.oneOf."694", { _ | Dyn } ])
              | optional,
            group | String | optional,
            kind | String | optional,
            name | String | optional,
            retryAfterSeconds | std.number.Integer | optional,
            uid | String | optional
          },
      oneOf."696" = String,
      oneOf."698" = { _ | Dyn },
      oneOf."699" = std.contract.any_of [ String, std.number.Integer ],
      oneOf."7" =
        {
            apiGroups | Array String | optional,
            apiVersions | Array String | optional,
            operations | Array String | optional,
            resourceNames | Array String | optional,
            resources | Array String | optional,
            scope | String | optional
          },
      oneOf."70" =
        {
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."67", { _ | Dyn } ])
              | optional,
            currentNumberScheduled | std.number.Integer,
            desiredNumberScheduled | std.number.Integer,
            numberAvailable | std.number.Integer | optional,
            numberMisscheduled | std.number.Integer,
            numberReady | std.number.Integer,
            numberUnavailable | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            updatedNumberScheduled | std.number.Integer | optional
          },
      oneOf."701" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'APIService |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."704" | { _ | Dyn } | optional,
            status | refs.oneOf."705" | { _ | Dyn } | optional
          },
      oneOf."702" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."704" =
        {
            caBundle | String | optional,
            group | String | optional,
            groupPriorityMinimum | std.number.Integer,
            insecureSkipTLSVerify | Bool | optional,
            service | refs.oneOf."706" | { _ | Dyn } | optional,
            version | String | optional,
            versionPriority | std.number.Integer
          },
      oneOf."705" =
        {
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."702", { _ | Dyn } ])
              | optional
          },
      oneOf."706" =
        {
            name | String | optional,
            namespace | String | optional,
            port | std.number.Integer | optional
          },
      oneOf."71" =
        {
            rollingUpdate | refs.oneOf."83" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."72" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'Deployment |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."75" | { _ | Dyn } | optional,
            status | refs.oneOf."76" | { _ | Dyn } | optional
          },
      oneOf."73" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            lastUpdateTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."75" =
        {
            minReadySeconds | std.number.Integer | optional,
            paused | Bool | optional,
            progressDeadlineSeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."683" | { _ | Dyn },
            strategy | refs.oneOf."77" | { _ | Dyn } | optional,
            template | refs.oneOf."332" | { _ | Dyn }
          },
      oneOf."76" =
        {
            availableReplicas | std.number.Integer | optional,
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."73", { _ | Dyn } ])
              | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            terminatingReplicas | std.number.Integer | optional,
            unavailableReplicas | std.number.Integer | optional,
            updatedReplicas | std.number.Integer | optional
          },
      oneOf."77" =
        {
            rollingUpdate | refs.oneOf."84" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."78" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'ReplicaSet |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."81" | { _ | Dyn } | optional,
            status | refs.oneOf."82" | { _ | Dyn } | optional
          },
      oneOf."79" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."8" = { apiVersion | String | optional, kind | String | optional },
      oneOf."81" =
        {
            minReadySeconds | std.number.Integer | optional,
            replicas | std.number.Integer | optional,
            selector | refs.oneOf."683" | { _ | Dyn },
            template | refs.oneOf."332" | { _ | Dyn } | optional
          },
      oneOf."82" =
        {
            availableReplicas | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."79", { _ | Dyn } ])
              | optional,
            fullyLabeledReplicas | std.number.Integer | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer,
            terminatingReplicas | std.number.Integer | optional
          },
      oneOf."83" =
        {
            maxSurge | refs.oneOf."699" | optional,
            maxUnavailable | refs.oneOf."699" | optional
          },
      oneOf."84" =
        {
            maxSurge | refs.oneOf."699" | optional,
            maxUnavailable | refs.oneOf."699" | optional
          },
      oneOf."85" =
        {
            maxUnavailable | refs.oneOf."699" | optional,
            partition | std.number.Integer | optional
          },
      oneOf."86" =
        {
            apiVersion | String | optional,
            kind | std.enum.TagOrString | [| 'StatefulSet |] | optional,
            metadata | refs.oneOf."688" | { _ | Dyn } | optional,
            spec | refs.oneOf."91" | { _ | Dyn } | optional,
            status | refs.oneOf."92" | { _ | Dyn } | optional
          },
      oneOf."87" =
        {
            lastTransitionTime | refs.oneOf."696" | String | optional,
            message | String | optional,
            reason | String | optional,
            status | String,
            type | String
          },
      oneOf."89" = { start | std.number.Integer | optional },
      oneOf."9" =
        {
            name | String | optional,
            namespace | String | optional,
            parameterNotFoundAction | String | optional,
            selector | refs.oneOf."683" | { _ | Dyn } | optional
          },
      oneOf."90" =
        { whenDeleted | String | optional, whenScaled | String | optional },
      oneOf."91" =
        {
            minReadySeconds | std.number.Integer | optional,
            ordinals | refs.oneOf."89" | { _ | Dyn } | optional,
            persistentVolumeClaimRetentionPolicy
              | refs.oneOf."90"
              | { _ | Dyn }
              | optional,
            podManagementPolicy | String | optional,
            replicas | std.number.Integer | optional,
            revisionHistoryLimit | std.number.Integer | optional,
            selector | refs.oneOf."683" | { _ | Dyn },
            serviceName | String | optional,
            template | refs.oneOf."332" | { _ | Dyn },
            updateStrategy | refs.oneOf."93" | { _ | Dyn } | optional,
            volumeClaimTemplates
              | Array (std.contract.Sequence [ refs.oneOf."302", { _ | Dyn } ])
              | optional
          },
      oneOf."92" =
        {
            availableReplicas | std.number.Integer | optional,
            collisionCount | std.number.Integer | optional,
            conditions
              | Array (std.contract.Sequence [ refs.oneOf."87", { _ | Dyn } ])
              | optional,
            currentReplicas | std.number.Integer | optional,
            currentRevision | String | optional,
            observedGeneration | std.number.Integer | optional,
            readyReplicas | std.number.Integer | optional,
            replicas | std.number.Integer,
            updateRevision | String | optional,
            updatedReplicas | std.number.Integer | optional
          },
      oneOf."93" =
        {
            rollingUpdate | refs.oneOf."85" | { _ | Dyn } | optional,
            type | String | optional
          },
      oneOf."94" =
        {
            apiVersion | String | optional,
            kind | String | optional,
            name | String | optional,
            uid | String | optional
          },
      oneOf."96" = { userInfo | refs.oneOf."103" | { _ | Dyn } | optional },
      oneOf."98" =
        {
            audiences | Array String,
            boundObjectRef | refs.oneOf."94" | { _ | Dyn } | optional,
            expirationSeconds | std.number.Integer | optional
          },
      oneOf."99" =
        { expirationTimestamp | refs.oneOf."696" | String, token | String }
    }
    in
  js2n.OneOf
      [
        js2n.record.Record
          {
            properties = { key = String, valueExpression = String },
            required = { key = true, valueExpression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fieldRef = String, warning = String },
            required = { fieldRef = true, warning = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."7",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."683",
                  objectSelector = refs.oneOf."683",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."7"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  admissionReviewVersions = js2n.array.ArrayOf String,
                  clientConfig = refs.oneOf."25",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."2",
                  matchPolicy = String,
                  name = String,
                  namespaceSelector = refs.oneOf."683",
                  objectSelector = refs.oneOf."683",
                  reinvocationPolicy = String,
                  rules = js2n.array.ArrayOf refs.oneOf."10",
                  sideEffects = String,
                  timeoutSeconds = std.number.Integer
                },
            required =
              {
                  admissionReviewVersions = true,
                  clientConfig = true,
                  name = true,
                  sideEffects = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingWebhookConfiguration |]
                        ],
                  metadata = refs.oneOf."688",
                  webhooks = js2n.array.ArrayOf refs.oneOf."4"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."5",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingWebhookConfigurationList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  parameterNotFoundAction = String,
                  selector = refs.oneOf."683"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  path = String,
                  port = std.number.Integer
                },
            required = { name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expressionWarnings = js2n.array.ArrayOf refs.oneOf."1" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicy |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."18",
                  status = refs.oneOf."19"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBinding |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."16"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."14",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchResources = refs.oneOf."3",
                  paramRef = refs.oneOf."9",
                  policyName = String,
                  validationActions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."13",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  auditAnnotations = js2n.array.ArrayOf refs.oneOf."0",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."2",
                  matchConstraints = refs.oneOf."3",
                  paramKind = refs.oneOf."8",
                  validations = js2n.array.ArrayOf refs.oneOf."23",
                  variables = js2n.array.ArrayOf refs.oneOf."24"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  observedGeneration = std.number.Integer,
                  typeChecking = refs.oneOf."12"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  admissionReviewVersions = js2n.array.ArrayOf String,
                  clientConfig = refs.oneOf."25",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."2",
                  matchPolicy = String,
                  name = String,
                  namespaceSelector = refs.oneOf."683",
                  objectSelector = refs.oneOf."683",
                  rules = js2n.array.ArrayOf refs.oneOf."10",
                  sideEffects = String,
                  timeoutSeconds = std.number.Integer
                },
            required =
              {
                  admissionReviewVersions = true,
                  clientConfig = true,
                  name = true,
                  sideEffects = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingWebhookConfiguration |]
                        ],
                  metadata = refs.oneOf."688",
                  webhooks = js2n.array.ArrayOf refs.oneOf."20"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."21",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingWebhookConfigurationList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  expression = String,
                  message = String,
                  messageExpression = String,
                  reason = String
                },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { caBundle = String, service = refs.oneOf."11", url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."37",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."683",
                  objectSelector = refs.oneOf."683",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."37"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicy |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."35"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyBinding |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."33"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."31",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchResources = refs.oneOf."29",
                  paramRef = refs.oneOf."39",
                  policyName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."30",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'MutatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."28",
                  matchConstraints = refs.oneOf."29",
                  mutations = js2n.array.ArrayOf refs.oneOf."36",
                  paramKind = refs.oneOf."38",
                  reinvocationPolicy = String,
                  variables = js2n.array.ArrayOf refs.oneOf."40"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  applyConfiguration = refs.oneOf."26",
                  jsonPatch = refs.oneOf."27",
                  patchType = String
                },
            required = { patchType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  parameterNotFoundAction = String,
                  selector = refs.oneOf."683"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, valueExpression = String },
            required = { key = true, valueExpression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fieldRef = String, warning = String },
            required = { fieldRef = true, warning = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  excludeResourceRules = js2n.array.ArrayOf refs.oneOf."45",
                  matchPolicy = String,
                  namespaceSelector = refs.oneOf."683",
                  objectSelector = refs.oneOf."683",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."45"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  apiVersions = js2n.array.ArrayOf String,
                  operations = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  scope = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  parameterNotFoundAction = String,
                  selector = refs.oneOf."683"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expressionWarnings = js2n.array.ArrayOf refs.oneOf."42" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicy |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."54",
                  status = refs.oneOf."55"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBinding |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."52"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."50",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyBindingList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchResources = refs.oneOf."44",
                  paramRef = refs.oneOf."47",
                  policyName = String,
                  validationActions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."49",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ValidatingAdmissionPolicyList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  auditAnnotations = js2n.array.ArrayOf refs.oneOf."41",
                  failurePolicy = String,
                  matchConditions = js2n.array.ArrayOf refs.oneOf."43",
                  matchConstraints = refs.oneOf."44",
                  paramKind = refs.oneOf."46",
                  validations = js2n.array.ArrayOf refs.oneOf."56",
                  variables = js2n.array.ArrayOf refs.oneOf."57"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  observedGeneration = std.number.Integer,
                  typeChecking = refs.oneOf."48"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  expression = String,
                  message = String,
                  messageExpression = String,
                  reason = String
                },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String, name = String },
            required = { expression = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiServerID = String,
                  decodableVersions = js2n.array.ArrayOf String,
                  encodingVersion = String,
                  servedVersions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageVersion |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."62",
                  status = refs.oneOf."63"
                },
            required = { spec = true, status = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  observedGeneration = std.number.Integer,
                  reason = String,
                  status = String,
                  type = String
                },
            required =
              { message = true, reason = true, status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."59",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageVersionList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties =
              {
                  commonEncodingVersion = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."60",
                  storageVersions = js2n.array.ArrayOf refs.oneOf."58"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  data = refs.oneOf."698",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ControllerRevision |] ],
                  metadata = refs.oneOf."688",
                  revision = std.number.Integer
                },
            required = { revision = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."64",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ControllerRevisionList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DaemonSet |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."69",
                  status = refs.oneOf."70"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."66",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DaemonSetList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."683",
                  template = refs.oneOf."332",
                  updateStrategy = refs.oneOf."71"
                },
            required = { selector = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."67",
                  currentNumberScheduled = std.number.Integer,
                  desiredNumberScheduled = std.number.Integer,
                  numberAvailable = std.number.Integer,
                  numberMisscheduled = std.number.Integer,
                  numberReady = std.number.Integer,
                  numberUnavailable = std.number.Integer,
                  observedGeneration = std.number.Integer,
                  updatedNumberScheduled = std.number.Integer
                },
            required =
              {
                  currentNumberScheduled = true,
                  desiredNumberScheduled = true,
                  numberMisscheduled = true,
                  numberReady = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."83", type = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Deployment |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."75",
                  status = refs.oneOf."76"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  lastUpdateTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."72",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeploymentList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  paused = Bool,
                  progressDeadlineSeconds = std.number.Integer,
                  replicas = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."683",
                  strategy = refs.oneOf."77",
                  template = refs.oneOf."332"
                },
            required = { selector = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."73",
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  terminatingReplicas = std.number.Integer,
                  unavailableReplicas = std.number.Integer,
                  updatedReplicas = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."84", type = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicaSet |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."81",
                  status = refs.oneOf."82"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."78",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicaSetList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  replicas = std.number.Integer,
                  selector = refs.oneOf."683",
                  template = refs.oneOf."332"
                },
            required = { selector = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."79",
                  fullyLabeledReplicas = std.number.Integer,
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  terminatingReplicas = std.number.Integer
                },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxSurge = refs.oneOf."699",
                  maxUnavailable = refs.oneOf."699"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxSurge = refs.oneOf."699",
                  maxUnavailable = refs.oneOf."699"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxUnavailable = refs.oneOf."699",
                  partition = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StatefulSet |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."91",
                  status = refs.oneOf."92"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."86",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StatefulSetList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { start = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { whenDeleted = String, whenScaled = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  ordinals = refs.oneOf."89",
                  persistentVolumeClaimRetentionPolicy = refs.oneOf."90",
                  podManagementPolicy = String,
                  replicas = std.number.Integer,
                  revisionHistoryLimit = std.number.Integer,
                  selector = refs.oneOf."683",
                  serviceName = String,
                  template = refs.oneOf."332",
                  updateStrategy = refs.oneOf."93",
                  volumeClaimTemplates = js2n.array.ArrayOf refs.oneOf."302"
                },
            required = { selector = true, template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  collisionCount = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."87",
                  currentReplicas = std.number.Integer,
                  currentRevision = String,
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer,
                  updateRevision = String,
                  updatedReplicas = std.number.Integer
                },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rollingUpdate = refs.oneOf."85", type = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind = String,
                  name = String,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SelfSubjectReview |] ],
                  metadata = refs.oneOf."688",
                  status = refs.oneOf."96"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { userInfo = refs.oneOf."103" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'TokenRequest |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."98",
                  status = refs.oneOf."99"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  audiences = js2n.array.ArrayOf String,
                  boundObjectRef = refs.oneOf."94",
                  expirationSeconds = std.number.Integer
                },
            required = { audiences = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { expirationTimestamp = refs.oneOf."696", token = String },
            required = { expirationTimestamp = true, token = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'TokenReview |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."101",
                  status = refs.oneOf."102"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { audiences = js2n.array.ArrayOf String, token = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  audiences = js2n.array.ArrayOf String,
                  authenticated = Bool,
                  error = String,
                  user = refs.oneOf."103"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  extra =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some (js2n.array.ArrayOf String)
                        },
                  groups = js2n.array.ArrayOf String,
                  uid = String,
                  username = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  rawSelector = String,
                  requirements = js2n.array.ArrayOf refs.oneOf."680"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  rawSelector = String,
                  requirements = js2n.array.ArrayOf refs.oneOf."684"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'LocalSubjectAccessReview |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."116",
                  status = refs.oneOf."117"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { path = String, verb = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceURLs = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldSelector = refs.oneOf."104",
                  group = String,
                  labelSelector = refs.oneOf."105",
                  name = String,
                  namespace = String,
                  resource = String,
                  subresource = String,
                  verb = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'SelfSubjectAccessReview |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."112",
                  status = refs.oneOf."117"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceAttributes = refs.oneOf."107",
                  resourceAttributes = refs.oneOf."109"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SelfSubjectRulesReview |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."114",
                  status = refs.oneOf."118"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { namespace = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SubjectAccessReview |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."116",
                  status = refs.oneOf."117"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  extra =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some (js2n.array.ArrayOf String)
                        },
                  groups = js2n.array.ArrayOf String,
                  nonResourceAttributes = refs.oneOf."107",
                  resourceAttributes = refs.oneOf."109",
                  uid = String,
                  user = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allowed = Bool,
                  denied = Bool,
                  evaluationError = String,
                  reason = String
                },
            required = { allowed = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  evaluationError = String,
                  incomplete = Bool,
                  nonResourceRules = js2n.array.ArrayOf refs.oneOf."108",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."110"
                },
            required =
              {
                  incomplete = true,
                  nonResourceRules = true,
                  resourceRules = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String, name = String },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscaler |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."122",
                  status = refs.oneOf."123"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."120",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscalerList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxReplicas = std.number.Integer,
                  minReplicas = std.number.Integer,
                  scaleTargetRef = refs.oneOf."119",
                  targetCPUUtilizationPercentage = std.number.Integer
                },
            required = { maxReplicas = true, scaleTargetRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  currentCPUUtilizationPercentage = std.number.Integer,
                  currentReplicas = std.number.Integer,
                  desiredReplicas = std.number.Integer,
                  lastScaleTime = refs.oneOf."696",
                  observedGeneration = std.number.Integer
                },
            required = { currentReplicas = true, desiredReplicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Scale |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."125",
                  status = refs.oneOf."126"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { replicas = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { replicas = std.number.Integer, selector = String },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { container = String, name = String, target = refs.oneOf."143" },
            required = { container = true, name = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { container = String, current = refs.oneOf."144", name = String },
            required = { container = true, current = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, kind = String, name = String },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metric = refs.oneOf."140", target = refs.oneOf."143" },
            required = { metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { current = refs.oneOf."144", metric = refs.oneOf."140" },
            required = { current = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  periodSeconds = std.number.Integer,
                  type = String,
                  value = std.number.Integer
                },
            required = { periodSeconds = true, type = true, value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  policies = js2n.array.ArrayOf refs.oneOf."132",
                  selectPolicy = String,
                  stabilizationWindowSeconds = std.number.Integer,
                  tolerance = std.contract.any_of [ Number, String ]
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscaler |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."138",
                  status = refs.oneOf."139"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { scaleDown = refs.oneOf."133", scaleUp = refs.oneOf."133" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."134",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'HorizontalPodAutoscalerList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  behavior = refs.oneOf."135",
                  maxReplicas = std.number.Integer,
                  metrics = js2n.array.ArrayOf refs.oneOf."141",
                  minReplicas = std.number.Integer,
                  scaleTargetRef = refs.oneOf."129"
                },
            required = { maxReplicas = true, scaleTargetRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."136",
                  currentMetrics = js2n.array.ArrayOf refs.oneOf."142",
                  currentReplicas = std.number.Integer,
                  desiredReplicas = std.number.Integer,
                  lastScaleTime = refs.oneOf."696",
                  observedGeneration = std.number.Integer
                },
            required = { desiredReplicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, selector = refs.oneOf."683" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerResource = refs.oneOf."127",
                  external = refs.oneOf."130",
                  object = refs.oneOf."145",
                  pods = refs.oneOf."147",
                  resource = refs.oneOf."149",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerResource = refs.oneOf."128",
                  external = refs.oneOf."131",
                  object = refs.oneOf."146",
                  pods = refs.oneOf."148",
                  resource = refs.oneOf."150",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  averageUtilization = std.number.Integer,
                  averageValue = std.contract.any_of [ Number, String ],
                  type = String,
                  value = std.contract.any_of [ Number, String ]
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  averageUtilization = std.number.Integer,
                  averageValue = std.contract.any_of [ Number, String ],
                  value = std.contract.any_of [ Number, String ]
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  describedObject = refs.oneOf."129",
                  metric = refs.oneOf."140",
                  target = refs.oneOf."143"
                },
            required = { describedObject = true, metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  current = refs.oneOf."144",
                  describedObject = refs.oneOf."129",
                  metric = refs.oneOf."140"
                },
            required =
              { current = true, describedObject = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metric = refs.oneOf."140", target = refs.oneOf."143" },
            required = { metric = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { current = refs.oneOf."144", metric = refs.oneOf."140" },
            required = { current = true, metric = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, target = refs.oneOf."143" },
            required = { name = true, target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { current = refs.oneOf."144", name = String },
            required = { current = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CronJob |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."153",
                  status = refs.oneOf."154"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."151",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CronJobList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  concurrencyPolicy = String,
                  failedJobsHistoryLimit = std.number.Integer,
                  jobTemplate = refs.oneOf."160",
                  schedule = String,
                  startingDeadlineSeconds = std.number.Integer,
                  successfulJobsHistoryLimit = std.number.Integer,
                  suspend = Bool,
                  timeZone = String
                },
            required = { jobTemplate = true, schedule = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = js2n.array.ArrayOf refs.oneOf."300",
                  lastScheduleTime = refs.oneOf."696",
                  lastSuccessfulTime = refs.oneOf."696"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Job |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."158",
                  status = refs.oneOf."159"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."696",
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."155",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'JobList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  activeDeadlineSeconds = std.number.Integer,
                  backoffLimit = std.number.Integer,
                  backoffLimitPerIndex = std.number.Integer,
                  completionMode = String,
                  completions = std.number.Integer,
                  managedBy = String,
                  manualSelector = Bool,
                  maxFailedIndexes = std.number.Integer,
                  parallelism = std.number.Integer,
                  podFailurePolicy = refs.oneOf."161",
                  podReplacementPolicy = String,
                  selector = refs.oneOf."683",
                  successPolicy = refs.oneOf."165",
                  suspend = Bool,
                  template = refs.oneOf."332",
                  ttlSecondsAfterFinished = std.number.Integer
                },
            required = { template = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = std.number.Integer,
                  completedIndexes = String,
                  completionTime = refs.oneOf."696",
                  conditions = js2n.array.ArrayOf refs.oneOf."156",
                  failed = std.number.Integer,
                  failedIndexes = String,
                  ready = std.number.Integer,
                  startTime = refs.oneOf."696",
                  succeeded = std.number.Integer,
                  terminating = std.number.Integer,
                  uncountedTerminatedPods = refs.oneOf."167"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."688", spec = refs.oneOf."158" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rules = js2n.array.ArrayOf refs.oneOf."164" },
            required = { rules = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerName = String,
                  operator = String,
                  values = js2n.array.ArrayOf std.number.Integer
                },
            required = { operator = true, values = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { status = String, type = String },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  action = String,
                  onExitCodes = refs.oneOf."162",
                  onPodConditions = js2n.array.ArrayOf refs.oneOf."163"
                },
            required = { action = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { rules = js2n.array.ArrayOf refs.oneOf."166" },
            required = { rules = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  succeededCount = std.number.Integer,
                  succeededIndexes = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  failed = js2n.array.ArrayOf String,
                  succeeded = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CertificateSigningRequest |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."171",
                  status = refs.oneOf."172"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  lastUpdateTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."168",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CertificateSigningRequestList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  expirationSeconds = std.number.Integer,
                  extra =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some (js2n.array.ArrayOf String)
                        },
                  groups = js2n.array.ArrayOf String,
                  request = String,
                  signerName = String,
                  uid = String,
                  usages = js2n.array.ArrayOf String,
                  username = String
                },
            required = { request = true, signerName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  certificate = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."169"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundle |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."175"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."173",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundleList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { signerName = String, trustBundle = String },
            required = { trustBundle = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundle |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."178"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."176",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterTrustBundleList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { signerName = String, trustBundle = String },
            required = { trustBundle = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Lease |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."181"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."179",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  acquireTime = refs.oneOf."687",
                  holderIdentity = String,
                  leaseDurationSeconds = std.number.Integer,
                  leaseTransitions = std.number.Integer,
                  preferredHolder = String,
                  renewTime = refs.oneOf."687",
                  strategy = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidate |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."184"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."182",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidateList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  binaryVersion = String,
                  emulationVersion = String,
                  leaseName = String,
                  pingTime = refs.oneOf."687",
                  renewTime = refs.oneOf."687",
                  strategy = String
                },
            required =
              { binaryVersion = true, leaseName = true, strategy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidate |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."187"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."185",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LeaseCandidateList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  binaryVersion = String,
                  emulationVersion = String,
                  leaseName = String,
                  pingTime = refs.oneOf."687",
                  renewTime = refs.oneOf."687",
                  strategy = String
                },
            required =
              { binaryVersion = true, leaseName = true, strategy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  partition = std.number.Integer,
                  readOnly = Bool,
                  volumeID = String
                },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nodeAffinity = refs.oneOf."283",
                  podAffinity = refs.oneOf."314",
                  podAntiAffinity = refs.oneOf."316"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { localhostProfile = String, type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devicePath = String, name = String },
            required = { devicePath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  cachingMode = String,
                  diskName = String,
                  diskURI = String,
                  fsType = String,
                  kind = String,
                  readOnly = Bool
                },
            required = { diskName = true, diskURI = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  readOnly = Bool,
                  secretName = String,
                  secretNamespace = String,
                  shareName = String
                },
            required = { secretName = true, shareName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { readOnly = Bool, secretName = String, shareName = String },
            required = { secretName = true, shareName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Binding |] ],
                  metadata = refs.oneOf."688",
                  target = refs.oneOf."300"
                },
            required = { target = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  controllerExpandSecretRef = refs.oneOf."366",
                  controllerPublishSecretRef = refs.oneOf."366",
                  driver = String,
                  fsType = String,
                  nodeExpandSecretRef = refs.oneOf."366",
                  nodePublishSecretRef = refs.oneOf."366",
                  nodeStageSecretRef = refs.oneOf."366",
                  readOnly = Bool,
                  volumeAttributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  volumeHandle = String
                },
            required = { driver = true, volumeHandle = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  driver = String,
                  fsType = String,
                  nodePublishSecretRef = refs.oneOf."272",
                  readOnly = Bool,
                  volumeAttributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driver = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  add = js2n.array.ArrayOf String,
                  drop = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  monitors = js2n.array.ArrayOf String,
                  path = String,
                  readOnly = Bool,
                  secretFile = String,
                  secretRef = refs.oneOf."366",
                  user = String
                },
            required = { monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  monitors = js2n.array.ArrayOf String,
                  path = String,
                  readOnly = Bool,
                  secretFile = String,
                  secretRef = refs.oneOf."272",
                  user = String
                },
            required = { monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."366",
                  volumeID = String
                },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."272",
                  volumeID = String
                },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { timeoutSeconds = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."683",
                  name = String,
                  "optional" = Bool,
                  path = String,
                  signerName = String
                },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  error = String,
                  message = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  conditions = js2n.array.ArrayOf refs.oneOf."205",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ComponentStatus |] ],
                  metadata = refs.oneOf."688"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."206",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ComponentStatusList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  binaryData =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  data =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  immutable = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ConfigMap |] ],
                  metadata = refs.oneOf."688"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, "optional" = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, name = String, "optional" = Bool },
            required = { key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."208",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ConfigMapList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  kubeletConfigKey = String,
                  name = String,
                  namespace = String,
                  resourceVersion = String,
                  uid = String
                },
            required =
              { kubeletConfigKey = true, name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  items = js2n.array.ArrayOf refs.oneOf."262",
                  name = String,
                  "optional" = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  items = js2n.array.ArrayOf refs.oneOf."262",
                  name = String,
                  "optional" = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  args = js2n.array.ArrayOf String,
                  command = js2n.array.ArrayOf String,
                  env = js2n.array.ArrayOf refs.oneOf."236",
                  envFrom = js2n.array.ArrayOf refs.oneOf."235",
                  image = String,
                  imagePullPolicy = String,
                  lifecycle = refs.oneOf."263",
                  livenessProbe = refs.oneOf."336",
                  name = String,
                  ports = js2n.array.ArrayOf refs.oneOf."217",
                  readinessProbe = refs.oneOf."336",
                  resizePolicy = js2n.array.ArrayOf refs.oneOf."218",
                  resources = refs.oneOf."353",
                  restartPolicy = String,
                  securityContext = refs.oneOf."368",
                  startupProbe = refs.oneOf."336",
                  stdin = Bool,
                  stdinOnce = Bool,
                  terminationMessagePath = String,
                  terminationMessagePolicy = String,
                  tty = Bool,
                  volumeDevices = js2n.array.ArrayOf refs.oneOf."391",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."392",
                  workingDir = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  names = js2n.array.ArrayOf String,
                  sizeBytes = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerPort = std.number.Integer,
                  hostIP = String,
                  hostPort = std.number.Integer,
                  name = String,
                  protocol = String
                },
            required = { containerPort = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { resourceName = String, restartPolicy = String },
            required = { resourceName = true, restartPolicy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  running = refs.oneOf."220",
                  terminated = refs.oneOf."221",
                  waiting = refs.oneOf."222"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { startedAt = refs.oneOf."696" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerID = String,
                  exitCode = std.number.Integer,
                  finishedAt = refs.oneOf."696",
                  message = String,
                  reason = String,
                  signal = std.number.Integer,
                  startedAt = refs.oneOf."696"
                },
            required = { exitCode = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { message = String, reason = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocatedResources =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  allocatedResourcesStatus =
                    js2n.array.ArrayOf refs.oneOf."354",
                  containerID = String,
                  image = String,
                  imageID = String,
                  lastState = refs.oneOf."219",
                  name = String,
                  ready = Bool,
                  resources = refs.oneOf."353",
                  restartCount = std.number.Integer,
                  started = Bool,
                  state = refs.oneOf."219",
                  stopSignal = String,
                  user = refs.oneOf."224",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."393"
                },
            required =
              {
                  image = true,
                  imageID = true,
                  name = true,
                  ready = true,
                  restartCount = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { linux = refs.oneOf."269" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { Port = std.number.Integer },
            required = { Port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { items = js2n.array.ArrayOf refs.oneOf."227" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldRef = refs.oneOf."299",
                  mode = std.number.Integer,
                  path = String,
                  resourceFieldRef = refs.oneOf."347"
                },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  items = js2n.array.ArrayOf refs.oneOf."227"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  medium = String,
                  sizeLimit = std.contract.any_of [ Number, String ]
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hostname = String,
                  ip = String,
                  nodeName = String,
                  targetRef = refs.oneOf."300"
                },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appProtocol = String,
                  name = String,
                  port = std.number.Integer,
                  protocol = String
                },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addresses = js2n.array.ArrayOf refs.oneOf."230",
                  notReadyAddresses = js2n.array.ArrayOf refs.oneOf."230",
                  ports = js2n.array.ArrayOf refs.oneOf."231"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Endpoints |] ],
                  metadata = refs.oneOf."688",
                  subsets = js2n.array.ArrayOf refs.oneOf."232"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."233",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointsList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configMapRef = refs.oneOf."209",
                  prefix = String,
                  secretRef = refs.oneOf."362"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { name = String, value = String, valueFrom = refs.oneOf."237" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configMapKeyRef = refs.oneOf."210",
                  fieldRef = refs.oneOf."299",
                  resourceFieldRef = refs.oneOf."347",
                  secretKeyRef = refs.oneOf."363"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  args = js2n.array.ArrayOf String,
                  command = js2n.array.ArrayOf String,
                  env = js2n.array.ArrayOf refs.oneOf."236",
                  envFrom = js2n.array.ArrayOf refs.oneOf."235",
                  image = String,
                  imagePullPolicy = String,
                  lifecycle = refs.oneOf."263",
                  livenessProbe = refs.oneOf."336",
                  name = String,
                  ports = js2n.array.ArrayOf refs.oneOf."217",
                  readinessProbe = refs.oneOf."336",
                  resizePolicy = js2n.array.ArrayOf refs.oneOf."218",
                  resources = refs.oneOf."353",
                  restartPolicy = String,
                  securityContext = refs.oneOf."368",
                  startupProbe = refs.oneOf."336",
                  stdin = Bool,
                  stdinOnce = Bool,
                  targetContainerName = String,
                  terminationMessagePath = String,
                  terminationMessagePolicy = String,
                  tty = Bool,
                  volumeDevices = js2n.array.ArrayOf refs.oneOf."391",
                  volumeMounts = js2n.array.ArrayOf refs.oneOf."392",
                  workingDir = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { volumeClaimTemplate = refs.oneOf."307" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  action = String,
                  apiVersion = String,
                  count = std.number.Integer,
                  eventTime = refs.oneOf."687",
                  firstTimestamp = refs.oneOf."696",
                  involvedObject = refs.oneOf."300",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Event |] ],
                  lastTimestamp = refs.oneOf."696",
                  message = String,
                  metadata = refs.oneOf."688",
                  reason = String,
                  related = refs.oneOf."300",
                  reportingComponent = String,
                  reportingInstance = String,
                  series = refs.oneOf."242",
                  source = refs.oneOf."243",
                  type = String
                },
            required = { involvedObject = true, metadata = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."240",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EventList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  count = std.number.Integer,
                  lastObservedTime = refs.oneOf."687"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { component = String, host = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { command = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  lun = std.number.Integer,
                  readOnly = Bool,
                  targetWWNs = js2n.array.ArrayOf String,
                  wwids = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  driver = String,
                  fsType = String,
                  options =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  readOnly = Bool,
                  secretRef = refs.oneOf."366"
                },
            required = { driver = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  driver = String,
                  fsType = String,
                  options =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  readOnly = Bool,
                  secretRef = refs.oneOf."272"
                },
            required = { driver = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { datasetName = String, datasetUUID = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  partition = std.number.Integer,
                  pdName = String,
                  readOnly = Bool
                },
            required = { pdName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { port = std.number.Integer, service = String },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { directory = String, repository = String, revision = String },
            required = { repository = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  endpoints = String,
                  endpointsNamespace = String,
                  path = String,
                  readOnly = Bool
                },
            required = { endpoints = true, path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { endpoints = String, path = String, readOnly = Bool },
            required = { endpoints = true, path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  host = String,
                  httpHeaders = js2n.array.ArrayOf refs.oneOf."255",
                  path = String,
                  port = refs.oneOf."699",
                  scheme = String
                },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, value = String },
            required = { name = true, value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { hostnames = js2n.array.ArrayOf String, ip = String },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ip = String },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { path = String, type = String },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  chapAuthDiscovery = Bool,
                  chapAuthSession = Bool,
                  fsType = String,
                  initiatorName = String,
                  iqn = String,
                  iscsiInterface = String,
                  lun = std.number.Integer,
                  portals = js2n.array.ArrayOf String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."366",
                  targetPortal = String
                },
            required = { iqn = true, lun = true, targetPortal = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  chapAuthDiscovery = Bool,
                  chapAuthSession = Bool,
                  fsType = String,
                  initiatorName = String,
                  iqn = String,
                  iscsiInterface = String,
                  lun = std.number.Integer,
                  portals = js2n.array.ArrayOf String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."272",
                  targetPortal = String
                },
            required = { iqn = true, lun = true, targetPortal = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { pullPolicy = String, reference = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { key = String, mode = std.number.Integer, path = String },
            required = { key = true, path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  postStart = refs.oneOf."264",
                  preStop = refs.oneOf."264",
                  stopSignal = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exec = refs.oneOf."244",
                  httpGet = refs.oneOf."254",
                  sleep = refs.oneOf."378",
                  tcpSocket = refs.oneOf."382"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LimitRange |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."268"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  "default" =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  defaultRequest =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  max =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  maxLimitRequestRatio =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  min =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."265",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'LimitRangeList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { limits = js2n.array.ArrayOf refs.oneOf."266" },
            required = { limits = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  gid = std.number.Integer,
                  supplementalGroups = js2n.array.ArrayOf std.number.Integer,
                  uid = std.number.Integer
                },
            required = { gid = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hostname = String,
                  ip = String,
                  ipMode = String,
                  ports = js2n.array.ArrayOf refs.oneOf."333"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ingress = js2n.array.ArrayOf refs.oneOf."270" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fsType = String, path = String },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { status = String, targetVolumeAttributesClassName = String },
            required = { status = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { path = String, readOnly = Bool, server = String },
            required = { path = true, server = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Namespace |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."279",
                  status = refs.oneOf."280"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."276",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NamespaceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { finalizers = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."277",
                  phase = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Node |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."295",
                  status = refs.oneOf."296"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { address = String, type = String },
            required = { address = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."335",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    refs.oneOf."292"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastHeartbeatTime = refs.oneOf."696",
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { configMap = refs.oneOf."212" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  active = refs.oneOf."285",
                  assigned = refs.oneOf."285",
                  error = String,
                  lastKnownGood = refs.oneOf."285"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { kubeletEndpoint = refs.oneOf."225" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { supplementalGroupsPolicy = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."281",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NodeList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { features = refs.oneOf."291", name = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { recursiveReadOnlyMounts = Bool, userNamespaces = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { nodeSelectorTerms = js2n.array.ArrayOf refs.oneOf."294" },
            required = { nodeSelectorTerms = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  operator = String,
                  values = js2n.array.ArrayOf String
                },
            required = { key = true, operator = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchExpressions = js2n.array.ArrayOf refs.oneOf."293",
                  matchFields = js2n.array.ArrayOf refs.oneOf."293"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  configSource = refs.oneOf."285",
                  externalID = String,
                  podCIDR = String,
                  podCIDRs = js2n.array.ArrayOf String,
                  providerID = String,
                  taints = js2n.array.ArrayOf refs.oneOf."383",
                  unschedulable = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addresses = js2n.array.ArrayOf refs.oneOf."282",
                  allocatable =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  conditions = js2n.array.ArrayOf refs.oneOf."284",
                  config = refs.oneOf."286",
                  daemonEndpoints = refs.oneOf."287",
                  features = refs.oneOf."288",
                  images = js2n.array.ArrayOf refs.oneOf."216",
                  nodeInfo = refs.oneOf."298",
                  phase = String,
                  runtimeHandlers = js2n.array.ArrayOf refs.oneOf."290",
                  volumesAttached = js2n.array.ArrayOf refs.oneOf."191",
                  volumesInUse = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { capacity = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  architecture = String,
                  bootID = String,
                  containerRuntimeVersion = String,
                  kernelVersion = String,
                  kubeProxyVersion = String,
                  kubeletVersion = String,
                  machineID = String,
                  operatingSystem = String,
                  osImage = String,
                  swap = refs.oneOf."297",
                  systemUUID = String
                },
            required =
              {
                  architecture = true,
                  bootID = true,
                  containerRuntimeVersion = true,
                  kernelVersion = true,
                  kubeProxyVersion = true,
                  kubeletVersion = true,
                  machineID = true,
                  operatingSystem = true,
                  osImage = true,
                  systemUUID = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiVersion = String, fieldPath = String },
            required = { fieldPath = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  fieldPath = String,
                  kind = String,
                  name = String,
                  namespace = String,
                  resourceVersion = String,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolume |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."310",
                  status = refs.oneOf."311"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolumeClaim |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."305",
                  status = refs.oneOf."306"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."696",
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."302",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PersistentVolumeClaimList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  accessModes = js2n.array.ArrayOf String,
                  dataSource = refs.oneOf."388",
                  dataSourceRef = refs.oneOf."389",
                  resources = refs.oneOf."396",
                  selector = refs.oneOf."683",
                  storageClassName = String,
                  volumeAttributesClassName = String,
                  volumeMode = String,
                  volumeName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  accessModes = js2n.array.ArrayOf String,
                  allocatedResourceStatuses =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  allocatedResources =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  conditions = js2n.array.ArrayOf refs.oneOf."303",
                  currentVolumeAttributesClassName = String,
                  modifyVolumeStatus = refs.oneOf."274",
                  phase = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."688", spec = refs.oneOf."305" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { claimName = String, readOnly = Bool },
            required = { claimName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."301",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PersistentVolumeList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  accessModes = js2n.array.ArrayOf String,
                  awsElasticBlockStore = refs.oneOf."188",
                  azureDisk = refs.oneOf."192",
                  azureFile = refs.oneOf."193",
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  cephfs = refs.oneOf."199",
                  cinder = refs.oneOf."201",
                  claimRef = refs.oneOf."300",
                  csi = refs.oneOf."196",
                  fc = refs.oneOf."245",
                  flexVolume = refs.oneOf."246",
                  flocker = refs.oneOf."248",
                  gcePersistentDisk = refs.oneOf."249",
                  glusterfs = refs.oneOf."252",
                  hostPath = refs.oneOf."258",
                  iscsi = refs.oneOf."259",
                  local = refs.oneOf."273",
                  mountOptions = js2n.array.ArrayOf String,
                  nfs = refs.oneOf."275",
                  nodeAffinity = refs.oneOf."394",
                  persistentVolumeReclaimPolicy = String,
                  photonPersistentDisk = refs.oneOf."312",
                  portworxVolume = refs.oneOf."334",
                  quobyte = refs.oneOf."338",
                  rbd = refs.oneOf."339",
                  scaleIO = refs.oneOf."356",
                  storageClassName = String,
                  storageos = refs.oneOf."379",
                  volumeAttributesClassName = String,
                  volumeMode = String,
                  vsphereVolume = refs.oneOf."397"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastPhaseTransitionTime = refs.oneOf."696",
                  message = String,
                  phase = String,
                  reason = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { fsType = String, pdID = String },
            required = { pdID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Pod |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."328",
                  status = refs.oneOf."329"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."398",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."315"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."683",
                  matchLabelKeys = js2n.array.ArrayOf String,
                  mismatchLabelKeys = js2n.array.ArrayOf String,
                  namespaceSelector = refs.oneOf."683",
                  namespaces = js2n.array.ArrayOf String,
                  topologyKey = String
                },
            required = { topologyKey = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  preferredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."398",
                  requiredDuringSchedulingIgnoredDuringExecution =
                    js2n.array.ArrayOf refs.oneOf."315"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastProbeTime = refs.oneOf."696",
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  observedGeneration = std.number.Integer,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nameservers = js2n.array.ArrayOf String,
                  options = js2n.array.ArrayOf refs.oneOf."319",
                  searches = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, value = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ip = String },
            required = { ip = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."313",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditionType = String },
            required = { conditionType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  resourceClaimName = String,
                  resourceClaimTemplateName = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, resourceClaimName = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appArmorProfile = refs.oneOf."190",
                  fsGroup = std.number.Integer,
                  fsGroupChangePolicy = String,
                  runAsGroup = std.number.Integer,
                  runAsNonRoot = Bool,
                  runAsUser = std.number.Integer,
                  seLinuxChangePolicy = String,
                  seLinuxOptions = refs.oneOf."355",
                  seccompProfile = refs.oneOf."360",
                  supplementalGroups = js2n.array.ArrayOf std.number.Integer,
                  supplementalGroupsPolicy = String,
                  sysctls = js2n.array.ArrayOf refs.oneOf."381",
                  windowsOptions = refs.oneOf."399"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  activeDeadlineSeconds = std.number.Integer,
                  affinity = refs.oneOf."189",
                  automountServiceAccountToken = Bool,
                  containers = js2n.array.ArrayOf refs.oneOf."215",
                  dnsConfig = refs.oneOf."318",
                  dnsPolicy = String,
                  enableServiceLinks = Bool,
                  ephemeralContainers = js2n.array.ArrayOf refs.oneOf."238",
                  hostAliases = js2n.array.ArrayOf refs.oneOf."256",
                  hostIPC = Bool,
                  hostNetwork = Bool,
                  hostPID = Bool,
                  hostUsers = Bool,
                  hostname = String,
                  imagePullSecrets = js2n.array.ArrayOf refs.oneOf."272",
                  initContainers = js2n.array.ArrayOf refs.oneOf."215",
                  nodeName = String,
                  nodeSelector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  os = refs.oneOf."322",
                  overhead =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  preemptionPolicy = String,
                  "priority" = std.number.Integer,
                  priorityClassName = String,
                  readinessGates = js2n.array.ArrayOf refs.oneOf."323",
                  resourceClaims = js2n.array.ArrayOf refs.oneOf."324",
                  resources = refs.oneOf."353",
                  restartPolicy = String,
                  runtimeClassName = String,
                  schedulerName = String,
                  schedulingGates = js2n.array.ArrayOf refs.oneOf."326",
                  securityContext = refs.oneOf."327",
                  serviceAccount = String,
                  serviceAccountName = String,
                  setHostnameAsFQDN = Bool,
                  shareProcessNamespace = Bool,
                  subdomain = String,
                  terminationGracePeriodSeconds = std.number.Integer,
                  tolerations = js2n.array.ArrayOf refs.oneOf."384",
                  topologySpreadConstraints =
                    js2n.array.ArrayOf refs.oneOf."387",
                  volumes = js2n.array.ArrayOf refs.oneOf."390"
                },
            required = { containers = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."317",
                  containerStatuses = js2n.array.ArrayOf refs.oneOf."223",
                  ephemeralContainerStatuses =
                    js2n.array.ArrayOf refs.oneOf."223",
                  hostIP = String,
                  hostIPs = js2n.array.ArrayOf refs.oneOf."257",
                  initContainerStatuses = js2n.array.ArrayOf refs.oneOf."223",
                  message = String,
                  nominatedNodeName = String,
                  observedGeneration = std.number.Integer,
                  phase = String,
                  podIP = String,
                  podIPs = js2n.array.ArrayOf refs.oneOf."320",
                  qosClass = String,
                  reason = String,
                  resize = String,
                  resourceClaimStatuses = js2n.array.ArrayOf refs.oneOf."325",
                  startTime = refs.oneOf."696"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodTemplate |] ],
                  metadata = refs.oneOf."688",
                  template = refs.oneOf."332"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."330",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodTemplateList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."688", spec = refs.oneOf."328" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { error = String, port = std.number.Integer, protocol = String },
            required = { port = true, protocol = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { fsType = String, readOnly = Bool, volumeID = String },
            required = { volumeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { preference = refs.oneOf."294", weight = std.number.Integer },
            required = { preference = true, weight = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exec = refs.oneOf."244",
                  failureThreshold = std.number.Integer,
                  grpc = refs.oneOf."250",
                  httpGet = refs.oneOf."254",
                  initialDelaySeconds = std.number.Integer,
                  periodSeconds = std.number.Integer,
                  successThreshold = std.number.Integer,
                  tcpSocket = refs.oneOf."382",
                  terminationGracePeriodSeconds = std.number.Integer,
                  timeoutSeconds = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  sources = js2n.array.ArrayOf refs.oneOf."395"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = String,
                  readOnly = Bool,
                  registry = String,
                  tenant = String,
                  user = String,
                  volume = String
                },
            required = { registry = true, volume = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  image = String,
                  keyring = String,
                  monitors = js2n.array.ArrayOf String,
                  pool = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."366",
                  user = String
                },
            required = { image = true, monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  image = String,
                  keyring = String,
                  monitors = js2n.array.ArrayOf String,
                  pool = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."272",
                  user = String
                },
            required = { image = true, monitors = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ReplicationController |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."344",
                  status = refs.oneOf."345"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."341",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ReplicationControllerList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  minReadySeconds = std.number.Integer,
                  replicas = std.number.Integer,
                  selector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  template = refs.oneOf."332"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  availableReplicas = std.number.Integer,
                  conditions = js2n.array.ArrayOf refs.oneOf."342",
                  fullyLabeledReplicas = std.number.Integer,
                  observedGeneration = std.number.Integer,
                  readyReplicas = std.number.Integer,
                  replicas = std.number.Integer
                },
            required = { replicas = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, request = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  containerName = String,
                  divisor = std.contract.any_of [ Number, String ],
                  resource = String
                },
            required = { resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { health = String, resourceID = String },
            required = { resourceID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceQuota |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."351",
                  status = refs.oneOf."352"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."349",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceQuotaList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hard =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  scopeSelector = refs.oneOf."358",
                  scopes = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hard =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  used =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  claims = js2n.array.ArrayOf refs.oneOf."346",
                  limits =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  resources = js2n.array.ArrayOf refs.oneOf."348"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { level = String, role = String, type = String, user = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  gateway = String,
                  protectionDomain = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."366",
                  sslEnabled = Bool,
                  storageMode = String,
                  storagePool = String,
                  system = String,
                  volumeName = String
                },
            required = { gateway = true, secretRef = true, system = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  gateway = String,
                  protectionDomain = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."272",
                  sslEnabled = Bool,
                  storageMode = String,
                  storagePool = String,
                  system = String,
                  volumeName = String
                },
            required = { gateway = true, secretRef = true, system = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchExpressions = js2n.array.ArrayOf refs.oneOf."359" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  operator = String,
                  scopeName = String,
                  values = js2n.array.ArrayOf String
                },
            required = { operator = true, scopeName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { localhostProfile = String, type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  data =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  immutable = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Secret |] ],
                  metadata = refs.oneOf."688",
                  stringData =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, "optional" = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, name = String, "optional" = Bool },
            required = { key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."361",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'SecretList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  items = js2n.array.ArrayOf refs.oneOf."262",
                  name = String,
                  "optional" = Bool
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, namespace = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultMode = std.number.Integer,
                  items = js2n.array.ArrayOf refs.oneOf."262",
                  "optional" = Bool,
                  secretName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allowPrivilegeEscalation = Bool,
                  appArmorProfile = refs.oneOf."190",
                  capabilities = refs.oneOf."198",
                  privileged = Bool,
                  procMount = String,
                  readOnlyRootFilesystem = Bool,
                  runAsGroup = std.number.Integer,
                  runAsNonRoot = Bool,
                  runAsUser = std.number.Integer,
                  seLinuxOptions = refs.oneOf."355",
                  seccompProfile = refs.oneOf."360",
                  windowsOptions = refs.oneOf."399"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Service |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."375",
                  status = refs.oneOf."376"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  automountServiceAccountToken = Bool,
                  imagePullSecrets = js2n.array.ArrayOf refs.oneOf."272",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceAccount |] ],
                  metadata = refs.oneOf."688",
                  secrets = js2n.array.ArrayOf refs.oneOf."300"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."370",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceAccountList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  audience = String,
                  expirationSeconds = std.number.Integer,
                  path = String
                },
            required = { path = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."369",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appProtocol = String,
                  name = String,
                  nodePort = std.number.Integer,
                  port = std.number.Integer,
                  protocol = String,
                  targetPort = refs.oneOf."699"
                },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocateLoadBalancerNodePorts = Bool,
                  clusterIP = String,
                  clusterIPs = js2n.array.ArrayOf String,
                  externalIPs = js2n.array.ArrayOf String,
                  externalName = String,
                  externalTrafficPolicy = String,
                  healthCheckNodePort = std.number.Integer,
                  internalTrafficPolicy = String,
                  ipFamilies = js2n.array.ArrayOf String,
                  ipFamilyPolicy = String,
                  loadBalancerClass = String,
                  loadBalancerIP = String,
                  loadBalancerSourceRanges = js2n.array.ArrayOf String,
                  ports = js2n.array.ArrayOf refs.oneOf."374",
                  publishNotReadyAddresses = Bool,
                  selector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  sessionAffinity = String,
                  sessionAffinityConfig = refs.oneOf."377",
                  trafficDistribution = String,
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  loadBalancer = refs.oneOf."271"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { clientIP = refs.oneOf."203" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { seconds = std.number.Integer },
            required = { seconds = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."300",
                  volumeName = String,
                  volumeNamespace = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  readOnly = Bool,
                  secretRef = refs.oneOf."272",
                  volumeName = String,
                  volumeNamespace = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, value = String },
            required = { name = true, value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { host = String, port = refs.oneOf."699" },
            required = { port = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."696",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { key = String, values = js2n.array.ArrayOf String },
            required = { key = true, values = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchLabelExpressions = js2n.array.ArrayOf refs.oneOf."385" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelector = refs.oneOf."683",
                  matchLabelKeys = js2n.array.ArrayOf String,
                  maxSkew = std.number.Integer,
                  minDomains = std.number.Integer,
                  nodeAffinityPolicy = String,
                  nodeTaintsPolicy = String,
                  topologyKey = String,
                  whenUnsatisfiable = String
                },
            required =
              { maxSkew = true, topologyKey = true, whenUnsatisfiable = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiGroup = String, kind = String, name = String },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  kind = String,
                  name = String,
                  namespace = String
                },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  awsElasticBlockStore = refs.oneOf."188",
                  azureDisk = refs.oneOf."192",
                  azureFile = refs.oneOf."194",
                  cephfs = refs.oneOf."200",
                  cinder = refs.oneOf."202",
                  configMap = refs.oneOf."214",
                  csi = refs.oneOf."197",
                  downwardAPI = refs.oneOf."228",
                  emptyDir = refs.oneOf."229",
                  ephemeral = refs.oneOf."239",
                  fc = refs.oneOf."245",
                  flexVolume = refs.oneOf."247",
                  flocker = refs.oneOf."248",
                  gcePersistentDisk = refs.oneOf."249",
                  gitRepo = refs.oneOf."251",
                  glusterfs = refs.oneOf."253",
                  hostPath = refs.oneOf."258",
                  image = refs.oneOf."261",
                  iscsi = refs.oneOf."260",
                  name = String,
                  nfs = refs.oneOf."275",
                  persistentVolumeClaim = refs.oneOf."308",
                  photonPersistentDisk = refs.oneOf."312",
                  portworxVolume = refs.oneOf."334",
                  projected = refs.oneOf."337",
                  quobyte = refs.oneOf."338",
                  rbd = refs.oneOf."340",
                  scaleIO = refs.oneOf."357",
                  secret = refs.oneOf."367",
                  storageos = refs.oneOf."380",
                  vsphereVolume = refs.oneOf."397"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devicePath = String, name = String },
            required = { devicePath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  mountPath = String,
                  mountPropagation = String,
                  name = String,
                  readOnly = Bool,
                  recursiveReadOnly = String,
                  subPath = String,
                  subPathExpr = String
                },
            required = { mountPath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  mountPath = String,
                  name = String,
                  readOnly = Bool,
                  recursiveReadOnly = String
                },
            required = { mountPath = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { required = refs.oneOf."292" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  clusterTrustBundle = refs.oneOf."204",
                  configMap = refs.oneOf."213",
                  downwardAPI = refs.oneOf."226",
                  secret = refs.oneOf."365",
                  serviceAccountToken = refs.oneOf."372"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  limits =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  requests =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fsType = String,
                  storagePolicyID = String,
                  storagePolicyName = String,
                  volumePath = String
                },
            required = { volumePath = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  podAffinityTerm = refs.oneOf."315",
                  weight = std.number.Integer
                },
            required = { podAffinityTerm = true, weight = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  gmsaCredentialSpec = String,
                  gmsaCredentialSpecName = String,
                  hostProcess = Bool,
                  runAsUserName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addresses = js2n.array.ArrayOf String,
                  conditions = refs.oneOf."401",
                  deprecatedTopology =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  hints = refs.oneOf."402",
                  hostname = String,
                  nodeName = String,
                  targetRef = refs.oneOf."300",
                  zone = String
                },
            required = { addresses = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ready = Bool, serving = Bool, terminating = Bool },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  forNodes = js2n.array.ArrayOf refs.oneOf."406",
                  forZones = js2n.array.ArrayOf refs.oneOf."407"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  appProtocol = String,
                  name = String,
                  port = std.number.Integer,
                  protocol = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  addressType = String,
                  apiVersion = String,
                  endpoints = js2n.array.ArrayOf refs.oneOf."400",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointSlice |] ],
                  metadata = refs.oneOf."688",
                  ports = js2n.array.ArrayOf refs.oneOf."403"
                },
            required = { addressType = true, endpoints = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."404",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EndpointSliceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  action = String,
                  apiVersion = String,
                  deprecatedCount = std.number.Integer,
                  deprecatedFirstTimestamp = refs.oneOf."696",
                  deprecatedLastTimestamp = refs.oneOf."696",
                  deprecatedSource = refs.oneOf."243",
                  eventTime = refs.oneOf."687",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Event |] ],
                  metadata = refs.oneOf."688",
                  note = String,
                  reason = String,
                  regarding = refs.oneOf."300",
                  related = refs.oneOf."300",
                  reportingController = String,
                  reportingInstance = String,
                  series = refs.oneOf."410",
                  type = String
                },
            required = { eventTime = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."408",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'EventList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  count = std.number.Integer,
                  lastObservedTime = refs.oneOf."687"
                },
            required = { count = true, lastObservedTime = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lendablePercent = std.number.Integer,
                  nominalConcurrencyShares = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'FlowSchema |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."416",
                  status = refs.oneOf."417"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."413",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'FlowSchemaList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  distinguisherMethod = refs.oneOf."412",
                  matchingPrecedence = std.number.Integer,
                  priorityLevelConfiguration = refs.oneOf."426",
                  rules = js2n.array.ArrayOf refs.oneOf."422"
                },
            required = { priorityLevelConfiguration = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."414" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { queuing = refs.oneOf."429", type = String },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  borrowingLimitPercent = std.number.Integer,
                  lendablePercent = std.number.Integer,
                  limitResponse = refs.oneOf."419",
                  nominalConcurrencyShares = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceURLs = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { nonResourceURLs = true, verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nonResourceRules = js2n.array.ArrayOf refs.oneOf."421",
                  resourceRules = js2n.array.ArrayOf refs.oneOf."430",
                  subjects = js2n.array.ArrayOf refs.oneOf."432"
                },
            required = { subjects = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PriorityLevelConfiguration |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."427",
                  status = refs.oneOf."428"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."423",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PriorityLevelConfigurationList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exempt = refs.oneOf."411",
                  limited = refs.oneOf."420",
                  type = String
                },
            required = { type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."424" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  handSize = std.number.Integer,
                  queueLengthLimit = std.number.Integer,
                  queues = std.number.Integer
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  clusterScope = Bool,
                  namespaces = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { apiGroups = true, resources = true, verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, namespace = String },
            required = { name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = refs.oneOf."418",
                  kind = String,
                  serviceAccount = refs.oneOf."431",
                  user = refs.oneOf."433"
                },
            required = { kind = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { backend = refs.oneOf."441", path = String, pathType = String },
            required = { backend = true, pathType = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { paths = js2n.array.ArrayOf refs.oneOf."434" },
            required = { paths = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddress |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."438"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."436",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddressList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { parentRef = refs.oneOf."462" },
            required = { parentRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cidr = String, except = js2n.array.ArrayOf String },
            required = { cidr = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Ingress |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."452",
                  status = refs.oneOf."453"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { resource = refs.oneOf."388", service = refs.oneOf."451" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressClass |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."445"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."442",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  kind = String,
                  name = String,
                  namespace = String,
                  scope = String
                },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { controller = String, parameters = refs.oneOf."444" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."440",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IngressList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hostname = String,
                  ip = String,
                  ports = js2n.array.ArrayOf refs.oneOf."449"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { ingress = js2n.array.ArrayOf refs.oneOf."447" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { error = String, port = std.number.Integer, protocol = String },
            required = { port = true, protocol = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { host = String, http = refs.oneOf."435" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, port = refs.oneOf."463" },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  defaultBackend = refs.oneOf."441",
                  ingressClassName = String,
                  rules = js2n.array.ArrayOf refs.oneOf."450",
                  tls = js2n.array.ArrayOf refs.oneOf."454"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { loadBalancer = refs.oneOf."448" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { hosts = js2n.array.ArrayOf String, secretName = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NetworkPolicy |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."461"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  ports = js2n.array.ArrayOf refs.oneOf."460",
                  to = js2n.array.ArrayOf refs.oneOf."459"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  from = js2n.array.ArrayOf refs.oneOf."459",
                  ports = js2n.array.ArrayOf refs.oneOf."460"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."455",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'NetworkPolicyList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  ipBlock = refs.oneOf."439",
                  namespaceSelector = refs.oneOf."683",
                  podSelector = refs.oneOf."683"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  endPort = std.number.Integer,
                  port = refs.oneOf."699",
                  protocol = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  egress = js2n.array.ArrayOf refs.oneOf."456",
                  ingress = js2n.array.ArrayOf refs.oneOf."457",
                  podSelector = refs.oneOf."683",
                  policyTypes = js2n.array.ArrayOf String
                },
            required = { podSelector = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = String,
                  name = String,
                  namespace = String,
                  resource = String
                },
            required = { name = true, resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { name = String, number = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDR |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."466",
                  status = refs.oneOf."467"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."464",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDRList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cidrs = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."678" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddress |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."470"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."468",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'IPAddressList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { parentRef = refs.oneOf."471" },
            required = { parentRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  group = String,
                  name = String,
                  namespace = String,
                  resource = String
                },
            required = { name = true, resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDR |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."474",
                  status = refs.oneOf."475"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."472",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ServiceCIDRList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cidrs = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."678" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  podFixed =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  handler = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RuntimeClass |] ],
                  metadata = refs.oneOf."688",
                  overhead = refs.oneOf."476",
                  scheduling = refs.oneOf."479"
                },
            required = { handler = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."477",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RuntimeClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  nodeSelector =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  tolerations = js2n.array.ArrayOf refs.oneOf."384"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  deleteOptions = refs.oneOf."679",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Eviction |] ],
                  metadata = refs.oneOf."688"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PodDisruptionBudget |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."483",
                  status = refs.oneOf."484"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."481",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'PodDisruptionBudgetList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  maxUnavailable = refs.oneOf."699",
                  minAvailable = refs.oneOf."699",
                  selector = refs.oneOf."683",
                  unhealthyPodEvictionPolicy = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  currentHealthy = std.number.Integer,
                  desiredHealthy = std.number.Integer,
                  disruptedPods =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."696"
                        },
                  disruptionsAllowed = std.number.Integer,
                  expectedPods = std.number.Integer,
                  observedGeneration = std.number.Integer
                },
            required =
              {
                  currentHealthy = true,
                  desiredHealthy = true,
                  disruptionsAllowed = true,
                  expectedPods = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { clusterRoleSelectors = js2n.array.ArrayOf refs.oneOf."683" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  aggregationRule = refs.oneOf."485",
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRole |] ],
                  metadata = refs.oneOf."688",
                  rules = js2n.array.ArrayOf refs.oneOf."490"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleBinding |] ],
                  metadata = refs.oneOf."688",
                  roleRef = refs.oneOf."495",
                  subjects = js2n.array.ArrayOf refs.oneOf."496"
                },
            required = { roleRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."487",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleBindingList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."486",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ClusterRoleList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroups = js2n.array.ArrayOf String,
                  nonResourceURLs = js2n.array.ArrayOf String,
                  resourceNames = js2n.array.ArrayOf String,
                  resources = js2n.array.ArrayOf String,
                  verbs = js2n.array.ArrayOf String
                },
            required = { verbs = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence [ std.enum.TagOrString, [| 'Role |] ],
                  metadata = refs.oneOf."688",
                  rules = js2n.array.ArrayOf refs.oneOf."490"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleBinding |] ],
                  metadata = refs.oneOf."688",
                  roleRef = refs.oneOf."495",
                  subjects = js2n.array.ArrayOf refs.oneOf."496"
                },
            required = { roleRef = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."492",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleBindingList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."491",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'RoleList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { apiGroup = String, kind = String, name = String },
            required = { apiGroup = true, kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  kind = String,
                  name = String,
                  namespace = String
                },
            required = { kind = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  data = refs.oneOf."698",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."525",
                  pool = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { devices = refs.oneOf."505", nodeSelector = refs.oneOf."292" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."506"
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some (std.contract.any_of [ Number, String ])
                        },
                  consumesCounters = js2n.array.ArrayOf refs.oneOf."514",
                  nodeName = String,
                  nodeSelector = refs.oneOf."292",
                  taints = js2n.array.ArrayOf refs.oneOf."519"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."501"
                        },
                  name = String
                },
            required = { counters = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { basic = refs.oneOf."499", name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."526",
                  requests = js2n.array.ArrayOf String,
                  source = String
                },
            required = { source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."504",
                  results = js2n.array.ArrayOf refs.oneOf."516"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  bool = Bool,
                  int = std.number.Integer,
                  string = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."508",
                  constraints = js2n.array.ArrayOf refs.oneOf."513",
                  requests = js2n.array.ArrayOf refs.oneOf."515"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."526",
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClass |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."512"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."526" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."509",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."510",
                  selectors = js2n.array.ArrayOf refs.oneOf."517"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchAttribute = String, requests = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counterSet = String,
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."501"
                        }
                },
            required = { counterSet = true, counters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  allocationMode = String,
                  count = std.number.Integer,
                  deviceClassName = String,
                  firstAvailable = js2n.array.ArrayOf refs.oneOf."518",
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."517",
                  tolerations = js2n.array.ArrayOf refs.oneOf."524"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  device = String,
                  driver = String,
                  pool = String,
                  request = String,
                  tolerations = js2n.array.ArrayOf refs.oneOf."524"
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."500" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationMode = String,
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."517",
                  tolerations = js2n.array.ArrayOf refs.oneOf."524"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."696",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceTaintRule |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."522"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."520",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceTaintRuleList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { deviceSelector = refs.oneOf."523", taint = refs.oneOf."519" },
            required = { taint = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  device = String,
                  deviceClassName = String,
                  driver = String,
                  pool = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."517"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hardwareAddress = String,
                  interfaceName = String,
                  ips = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { driver = String, parameters = refs.oneOf."698" },
            required = { driver = true, parameters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaim |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."530",
                  status = refs.oneOf."531"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  name = String,
                  resource = String,
                  uid = String
                },
            required = { name = true, resource = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."527",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."507" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."498",
                  devices = js2n.array.ArrayOf refs.oneOf."497",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."528"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimTemplate |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."534"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."532",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."688", spec = refs.oneOf."530" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  generation = std.number.Integer,
                  name = String,
                  resourceSliceCount = std.number.Integer
                },
            required =
              { generation = true, name = true, resourceSliceCount = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSlice |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."538"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."536",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  devices = js2n.array.ArrayOf refs.oneOf."503",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."292",
                  perDeviceNodeSelection = Bool,
                  pool = refs.oneOf."535",
                  sharedCounters = js2n.array.ArrayOf refs.oneOf."502"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  data = refs.oneOf."698",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."564",
                  pool = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { devices = refs.oneOf."547", nodeSelector = refs.oneOf."292" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."548"
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."549"
                        },
                  consumesCounters = js2n.array.ArrayOf refs.oneOf."557",
                  nodeName = String,
                  nodeSelector = refs.oneOf."292",
                  taints = js2n.array.ArrayOf refs.oneOf."562"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."543"
                        },
                  name = String
                },
            required = { counters = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { basic = refs.oneOf."541", name = String },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."565",
                  requests = js2n.array.ArrayOf String,
                  source = String
                },
            required = { source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."546",
                  results = js2n.array.ArrayOf refs.oneOf."559"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  bool = Bool,
                  int = std.number.Integer,
                  string = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."551",
                  constraints = js2n.array.ArrayOf refs.oneOf."556",
                  requests = js2n.array.ArrayOf refs.oneOf."558"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."565",
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClass |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."555"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."565" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."552",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."553",
                  selectors = js2n.array.ArrayOf refs.oneOf."560"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchAttribute = String, requests = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counterSet = String,
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."543"
                        }
                },
            required = { counterSet = true, counters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  allocationMode = String,
                  count = std.number.Integer,
                  deviceClassName = String,
                  firstAvailable = js2n.array.ArrayOf refs.oneOf."561",
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."560",
                  tolerations = js2n.array.ArrayOf refs.oneOf."563"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  device = String,
                  driver = String,
                  pool = String,
                  request = String,
                  tolerations = js2n.array.ArrayOf refs.oneOf."563"
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."542" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationMode = String,
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."560",
                  tolerations = js2n.array.ArrayOf refs.oneOf."563"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."696",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hardwareAddress = String,
                  interfaceName = String,
                  ips = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { driver = String, parameters = refs.oneOf."698" },
            required = { driver = true, parameters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaim |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."569",
                  status = refs.oneOf."570"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  name = String,
                  resource = String,
                  uid = String
                },
            required = { name = true, resource = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."566",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."550" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."540",
                  devices = js2n.array.ArrayOf refs.oneOf."539",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."567"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimTemplate |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."573"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."571",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."688", spec = refs.oneOf."569" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  generation = std.number.Integer,
                  name = String,
                  resourceSliceCount = std.number.Integer
                },
            required =
              { generation = true, name = true, resourceSliceCount = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSlice |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."577"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."575",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  devices = js2n.array.ArrayOf refs.oneOf."545",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."292",
                  perDeviceNodeSelection = Bool,
                  pool = refs.oneOf."574",
                  sharedCounters = js2n.array.ArrayOf refs.oneOf."544"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."678",
                  data = refs.oneOf."698",
                  device = String,
                  driver = String,
                  networkData = refs.oneOf."603",
                  pool = String
                },
            required = { device = true, driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { devices = refs.oneOf."585", nodeSelector = refs.oneOf."292" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { expression = String },
            required = { expression = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."581"
                        },
                  name = String
                },
            required = { counters = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  attributes =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."586"
                        },
                  capacity =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."587"
                        },
                  consumesCounters = js2n.array.ArrayOf refs.oneOf."595",
                  name = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."292",
                  taints = js2n.array.ArrayOf refs.oneOf."600"
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."604",
                  requests = js2n.array.ArrayOf String,
                  source = String
                },
            required = { source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."584",
                  results = js2n.array.ArrayOf refs.oneOf."597"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  bool = Bool,
                  int = std.number.Integer,
                  string = String,
                  version = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { value = std.contract.any_of [ Number, String ] },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."589",
                  constraints = js2n.array.ArrayOf refs.oneOf."594",
                  requests = js2n.array.ArrayOf refs.oneOf."596"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  opaque = refs.oneOf."604",
                  requests = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClass |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."593"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { opaque = refs.oneOf."604" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."590",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeviceClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  config = js2n.array.ArrayOf refs.oneOf."591",
                  selectors = js2n.array.ArrayOf refs.oneOf."598"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { matchAttribute = String, requests = js2n.array.ArrayOf String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  counterSet = String,
                  counters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."581"
                        }
                },
            required = { counterSet = true, counters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  exactly = refs.oneOf."602",
                  firstAvailable = js2n.array.ArrayOf refs.oneOf."599",
                  name = String
                },
            required = { name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  device = String,
                  driver = String,
                  pool = String,
                  request = String,
                  tolerations = js2n.array.ArrayOf refs.oneOf."601"
                },
            required =
              { device = true, driver = true, pool = true, request = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { cel = refs.oneOf."580" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocationMode = String,
                  count = std.number.Integer,
                  deviceClassName = String,
                  name = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."598",
                  tolerations = js2n.array.ArrayOf refs.oneOf."601"
                },
            required = { deviceClassName = true, name = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  timeAdded = refs.oneOf."696",
                  value = String
                },
            required = { effect = true, key = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  effect = String,
                  key = String,
                  operator = String,
                  tolerationSeconds = std.number.Integer,
                  value = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  adminAccess = Bool,
                  allocationMode = String,
                  count = std.number.Integer,
                  deviceClassName = String,
                  selectors = js2n.array.ArrayOf refs.oneOf."598",
                  tolerations = js2n.array.ArrayOf refs.oneOf."601"
                },
            required = { deviceClassName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  hardwareAddress = String,
                  interfaceName = String,
                  ips = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { driver = String, parameters = refs.oneOf."698" },
            required = { driver = true, parameters = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaim |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."608",
                  status = refs.oneOf."609"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiGroup = String,
                  name = String,
                  resource = String,
                  uid = String
                },
            required = { name = true, resource = true, uid = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."605",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { devices = refs.oneOf."588" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocation = refs.oneOf."579",
                  devices = js2n.array.ArrayOf refs.oneOf."578",
                  reservedFor = js2n.array.ArrayOf refs.oneOf."606"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceClaimTemplate |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."612"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."610",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'ResourceClaimTemplateList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { metadata = refs.oneOf."688", spec = refs.oneOf."608" },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  generation = std.number.Integer,
                  name = String,
                  resourceSliceCount = std.number.Integer
                },
            required =
              { generation = true, name = true, resourceSliceCount = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSlice |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."616"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."614",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'ResourceSliceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allNodes = Bool,
                  devices = js2n.array.ArrayOf refs.oneOf."583",
                  driver = String,
                  nodeName = String,
                  nodeSelector = refs.oneOf."292",
                  perDeviceNodeSelection = Bool,
                  pool = refs.oneOf."613",
                  sharedCounters = js2n.array.ArrayOf refs.oneOf."582"
                },
            required = { driver = true, pool = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  description = String,
                  globalDefault = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PriorityClass |] ],
                  metadata = refs.oneOf."688",
                  preemptionPolicy = String,
                  value = std.number.Integer
                },
            required = { value = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."617",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'PriorityClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIDriver |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."621"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."619",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIDriverList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attachRequired = Bool,
                  fsGroupPolicy = String,
                  nodeAllocatableUpdatePeriodSeconds = std.number.Integer,
                  podInfoOnMount = Bool,
                  requiresRepublish = Bool,
                  seLinuxMount = Bool,
                  storageCapacity = Bool,
                  tokenRequests = js2n.array.ArrayOf refs.oneOf."630",
                  volumeLifecycleModes = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSINode |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."625"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allocatable = refs.oneOf."637",
                  name = String,
                  nodeID = String,
                  topologyKeys = js2n.array.ArrayOf String
                },
            required = { name = true, nodeID = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."622",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSINodeList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { drivers = js2n.array.ArrayOf refs.oneOf."623" },
            required = { drivers = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  capacity = std.contract.any_of [ Number, String ],
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIStorageCapacity |] ],
                  maximumVolumeSize = std.contract.any_of [ Number, String ],
                  metadata = refs.oneOf."688",
                  nodeTopology = refs.oneOf."683",
                  storageClassName = String
                },
            required = { storageClassName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."626",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'CSIStorageCapacityList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  allowVolumeExpansion = Bool,
                  allowedTopologies = js2n.array.ArrayOf refs.oneOf."386",
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageClass |] ],
                  metadata = refs.oneOf."688",
                  mountOptions = js2n.array.ArrayOf String,
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  provisioner = String,
                  reclaimPolicy = String,
                  volumeBindingMode = String
                },
            required = { provisioner = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."628",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'StorageClassList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { audience = String, expirationSeconds = std.number.Integer },
            required = { audience = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttachment |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."634",
                  status = refs.oneOf."635"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."631",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttachmentList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  inlineVolumeSpec = refs.oneOf."310",
                  persistentVolumeName = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attacher = String,
                  nodeName = String,
                  source = refs.oneOf."633"
                },
            required = { attacher = true, nodeName = true, source = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  attachError = refs.oneOf."636",
                  attached = Bool,
                  attachmentMetadata =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  detachError = refs.oneOf."636"
                },
            required = { attached = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  errorCode = std.number.Integer,
                  message = String,
                  time = refs.oneOf."696"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { count = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  driverName = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttributesClass |] ],
                  metadata = refs.oneOf."688",
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driverName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."638",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  driverName = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'VolumeAttributesClass |] ],
                  metadata = refs.oneOf."688",
                  parameters =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = { driverName = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."640",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'VolumeAttributesClassList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { group = String, resource = String, version = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastUpdateTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'StorageVersionMigration |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."646",
                  status = refs.oneOf."647"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."644",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'StorageVersionMigrationList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { continueToken = String, resource = refs.oneOf."642" },
            required = { resource = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conditions = js2n.array.ArrayOf refs.oneOf."643",
                  resourceVersion = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  description = String,
                  format = String,
                  jsonPath = String,
                  name = String,
                  "priority" = std.number.Integer,
                  type = String
                },
            required = { jsonPath = true, name = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { strategy = String, webhook = refs.oneOf."671" },
            required = { strategy = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CustomResourceDefinition |]
                        ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."654",
                  status = refs.oneOf."655"
                },
            required = { spec = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."650",
                  kind =
                    std.contract.Sequence
                        [
                          std.enum.TagOrString,
                          [| 'CustomResourceDefinitionList |]
                        ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  categories = js2n.array.ArrayOf String,
                  kind = String,
                  listKind = String,
                  plural = String,
                  shortNames = js2n.array.ArrayOf String,
                  singular = String
                },
            required = { kind = true, plural = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  conversion = refs.oneOf."649",
                  group = String,
                  names = refs.oneOf."653",
                  preserveUnknownFields = Bool,
                  scope = String,
                  versions = js2n.array.ArrayOf refs.oneOf."656"
                },
            required =
              { group = true, names = true, scope = true, versions = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  acceptedNames = refs.oneOf."653",
                  conditions = js2n.array.ArrayOf refs.oneOf."651",
                  storedVersions = js2n.array.ArrayOf String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  additionalPrinterColumns =
                    js2n.array.ArrayOf refs.oneOf."648",
                  deprecated = Bool,
                  deprecationWarning = String,
                  name = String,
                  schema = refs.oneOf."660",
                  selectableFields = js2n.array.ArrayOf refs.oneOf."667",
                  served = Bool,
                  storage = Bool,
                  subresources = refs.oneOf."659"
                },
            required = { name = true, served = true, storage = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  labelSelectorPath = String,
                  specReplicasPath = String,
                  statusReplicasPath = String
                },
            required = { specReplicasPath = true, statusReplicasPath = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties =
              { scale = refs.oneOf."657", status = refs.oneOf."658" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { openAPIV3Schema = refs.oneOf."663" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { description = String, url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        js2n.record.Record
          {
            properties =
              {
                  "$ref" = String,
                  "$schema" = String,
                  additionalItems =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  additionalProperties =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  allOf = js2n.array.ArrayOf refs.oneOf."663",
                  anyOf = js2n.array.ArrayOf refs.oneOf."663",
                  "default" =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  definitions =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."663"
                        },
                  dependencies =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional =
                            'Some
                                (std.contract.any_of
                                  [
                                    js2n.Null,
                                    Bool,
                                    { _ | Dyn },
                                    Array Dyn,
                                    Number,
                                    String
                                  ])
                        },
                  description = String,
                  enum =
                    js2n.array.ArrayOf
                        (std.contract.any_of
                          [
                            js2n.Null,
                            Bool,
                            { _ | Dyn },
                            Array Dyn,
                            Number,
                            String
                          ]),
                  example =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  exclusiveMaximum = Bool,
                  exclusiveMinimum = Bool,
                  externalDocs = refs.oneOf."661",
                  format = String,
                  id = String,
                  items =
                    std.contract.any_of
                        [
                          js2n.Null,
                          Bool,
                          { _ | Dyn },
                          Array Dyn,
                          Number,
                          String
                        ],
                  maxItems = std.number.Integer,
                  maxLength = std.number.Integer,
                  maxProperties = std.number.Integer,
                  maximum = Number,
                  minItems = std.number.Integer,
                  minLength = std.number.Integer,
                  minProperties = std.number.Integer,
                  minimum = Number,
                  multipleOf = Number,
                  not = refs.oneOf."663",
                  nullable = Bool,
                  oneOf = js2n.array.ArrayOf refs.oneOf."663",
                  pattern = String,
                  patternProperties =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."663"
                        },
                  properties =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some refs.oneOf."663"
                        },
                  required = js2n.array.ArrayOf String,
                  title = String,
                  type = String,
                  uniqueItems = Bool,
                  x-kubernetes-embedded-resource = Bool,
                  x-kubernetes-int-or-string = Bool,
                  x-kubernetes-list-map-keys = js2n.array.ArrayOf String,
                  x-kubernetes-list-type = String,
                  x-kubernetes-map-type = String,
                  x-kubernetes-preserve-unknown-fields = Bool,
                  x-kubernetes-validations = js2n.array.ArrayOf refs.oneOf."669"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        std.contract.any_of
          [ js2n.Null, Bool, Number, String, { _ | Dyn }, Array Dyn ],
        js2n.record.Record
          {
            properties = { jsonPath = String },
            required = { jsonPath = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  name = String,
                  namespace = String,
                  path = String,
                  port = std.number.Integer
                },
            required = { name = true, namespace = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  fieldPath = String,
                  message = String,
                  messageExpression = String,
                  optionalOldSelf = Bool,
                  reason = String,
                  rule = String
                },
            required = { rule = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { caBundle = String, service = refs.oneOf."668", url = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  clientConfig = refs.oneOf."670",
                  conversionReviewVersions = js2n.array.ArrayOf String
                },
            required = { conversionReviewVersions = true },
            patterns = {},
            additional = 'None
          },
        std.contract.any_of [ Number, String ],
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIGroup |] ],
                  name = String,
                  preferredVersion = refs.oneOf."682",
                  serverAddressByClientCIDRs =
                    js2n.array.ArrayOf refs.oneOf."692",
                  versions = js2n.array.ArrayOf refs.oneOf."682"
                },
            required = { name = true, versions = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  groups = js2n.array.ArrayOf refs.oneOf."673",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIGroupList |] ]
                },
            required = { groups = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  categories = js2n.array.ArrayOf String,
                  group = String,
                  kind = String,
                  name = String,
                  namespaced = Bool,
                  shortNames = js2n.array.ArrayOf String,
                  singularName = String,
                  storageVersionHash = String,
                  verbs = js2n.array.ArrayOf String,
                  version = String
                },
            required =
              {
                  kind = true,
                  name = true,
                  namespaced = true,
                  singularName = true,
                  verbs = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  groupVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIResourceList |] ],
                  resources = js2n.array.ArrayOf refs.oneOf."675"
                },
            required = { groupVersion = true, resources = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIVersions |] ],
                  serverAddressByClientCIDRs =
                    js2n.array.ArrayOf refs.oneOf."692",
                  versions = js2n.array.ArrayOf String
                },
            required = { serverAddressByClientCIDRs = true, versions = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  observedGeneration = std.number.Integer,
                  reason = String,
                  status = String,
                  type = String
                },
            required =
              {
                  lastTransitionTime = true,
                  message = true,
                  reason = true,
                  status = true,
                  type = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  dryRun = js2n.array.ArrayOf String,
                  gracePeriodSeconds = std.number.Integer,
                  ignoreStoreReadErrorWithClusterBreakingPotential = Bool,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'DeleteOptions |] ],
                  orphanDependents = Bool,
                  preconditions = refs.oneOf."691",
                  propagationPolicy = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  operator = String,
                  values = js2n.array.ArrayOf String
                },
            required = { key = true, operator = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties = { groupVersion = String, version = String },
            required = { groupVersion = true, version = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  matchExpressions = js2n.array.ArrayOf refs.oneOf."684",
                  matchLabels =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        }
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  key = String,
                  operator = String,
                  values = js2n.array.ArrayOf String
                },
            required = { key = true, operator = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  continue = String,
                  remainingItemCount = std.number.Integer,
                  resourceVersion = String,
                  selfLink = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  fieldsType = String,
                  fieldsV1 = refs.oneOf."681",
                  manager = String,
                  operation = String,
                  subresource = String,
                  time = refs.oneOf."696"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        String,
        js2n.record.Record
          {
            properties =
              {
                  annotations =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  creationTimestamp = refs.oneOf."696",
                  deletionGracePeriodSeconds = std.number.Integer,
                  deletionTimestamp = refs.oneOf."696",
                  finalizers = js2n.array.ArrayOf String,
                  generateName = String,
                  generation = std.number.Integer,
                  labels =
                    js2n.record.Record
                        {
                          properties = {},
                          required = {},
                          patterns = {},
                          additional = 'Some String
                        },
                  managedFields = js2n.array.ArrayOf refs.oneOf."686",
                  name = String,
                  namespace = String,
                  ownerReferences = js2n.array.ArrayOf refs.oneOf."689",
                  resourceVersion = String,
                  selfLink = String,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  blockOwnerDeletion = Bool,
                  controller = Bool,
                  kind = String,
                  name = String,
                  uid = String
                },
            required =
              { apiVersion = true, kind = true, name = true, uid = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        js2n.record.Record
          {
            properties = { resourceVersion = String, uid = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { clientCIDR = String, serverAddress = String },
            required = { clientCIDR = true, serverAddress = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  code = std.number.Integer,
                  details = refs.oneOf."695",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'Status |] ],
                  message = String,
                  metadata = refs.oneOf."685",
                  reason = String,
                  status = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { field = String, message = String, reason = String },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  causes = js2n.array.ArrayOf refs.oneOf."694",
                  group = String,
                  kind = String,
                  name = String,
                  retryAfterSeconds = std.number.Integer,
                  uid = String
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        String,
        js2n.record.Record
          {
            properties = { object = refs.oneOf."698", type = String },
            required = { object = true, type = true },
            patterns = {},
            additional = 'None
          },
        { _ | Dyn },
        std.contract.any_of [ String, std.number.Integer ],
        js2n.record.Record
          {
            properties =
              {
                  buildDate = String,
                  compiler = String,
                  emulationMajor = String,
                  emulationMinor = String,
                  gitCommit = String,
                  gitTreeState = String,
                  gitVersion = String,
                  goVersion = String,
                  major = String,
                  minCompatibilityMajor = String,
                  minCompatibilityMinor = String,
                  minor = String,
                  platform = String
                },
            required =
              {
                  buildDate = true,
                  compiler = true,
                  gitCommit = true,
                  gitTreeState = true,
                  gitVersion = true,
                  goVersion = true,
                  major = true,
                  minor = true,
                  platform = true
                },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIService |] ],
                  metadata = refs.oneOf."688",
                  spec = refs.oneOf."704",
                  status = refs.oneOf."705"
                },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  lastTransitionTime = refs.oneOf."696",
                  message = String,
                  reason = String,
                  status = String,
                  type = String
                },
            required = { status = true, type = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  apiVersion = String,
                  items = js2n.array.ArrayOf refs.oneOf."701",
                  kind =
                    std.contract.Sequence
                        [ std.enum.TagOrString, [| 'APIServiceList |] ],
                  metadata = refs.oneOf."685"
                },
            required = { items = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              {
                  caBundle = String,
                  group = String,
                  groupPriorityMinimum = std.number.Integer,
                  insecureSkipTLSVerify = Bool,
                  service = refs.oneOf."706",
                  version = String,
                  versionPriority = std.number.Integer
                },
            required = { groupPriorityMinimum = true, versionPriority = true },
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties = { conditions = js2n.array.ArrayOf refs.oneOf."702" },
            required = {},
            patterns = {},
            additional = 'None
          },
        js2n.record.Record
          {
            properties =
              { name = String, namespace = String, port = std.number.Integer },
            required = {},
            patterns = {},
            additional = 'None
          }
      ]