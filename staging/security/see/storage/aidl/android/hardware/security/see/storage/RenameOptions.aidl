/*
 * Copyright 2024 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package android.hardware.security.see.storage;

import android.hardware.security.see.storage.CreationMode;
import android.hardware.security.see.storage.ReadIntegrity;

parcelable RenameOptions {
    /** Controls creation behavior of the dest file. See `CreationMode` docs for details. */
    CreationMode destCreateMode = CreationMode.CREATE_EXCLUSIVE;

    /**
     * Set to acknowledge possible files tampering.
     *
     * If unacknowledged tampering is detected, the operation will fail with an ERR_FS_*
     * service-specific code.
     */
    ReadIntegrity readIntegrity = ReadIntegrity.NO_TAMPER;

    /**
     * Allow writes to succeed while the filesystem is in the middle of an A/B update.
     *
     * If the A/B update fails, the operation will be rolled back. This rollback will not
     * cause subsequent operations fail with any ERR_FS_* code nor will need to be
     * acknowledged by setting the `readIntegrity`.
     */
    boolean allowWritesDuringAbUpdate = false;
}
