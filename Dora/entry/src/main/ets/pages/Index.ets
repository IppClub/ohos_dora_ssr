/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonConstants from '../common/CommonConstants'
import common from '@ohos.app.ability.common'
import fs from '@ohos.file.fs';
import fileuri from '@ohos.file.fileuri';
import {
  notifySdlPageShow,
  notifySdlAboutToAppear,
  notifySdlAboutToDisappear,
  notifySdlPageHide,
} from '../service/SdlModule'

import { setWindowStyle } from '../service/ResponseNative'

import { addRootNode } from '../service/adapter_c/utils/AdapterTs'
import { NodeParams, NodeType, ViewNodeController} from '../service/adapter_c/common/Node'
import { XComponentModel } from '../service/adapter_c/common/ComponentModel'
import entry from 'libentry.so'

let storage = LocalStorage.getShared()
@Entry(storage)
@Component
struct Index {
  @LocalStorageProp("uiContext") uiContext: UIContext | null = null
  @LocalStorageProp("windowId") windowId: number = 0;
  @State rootNodeController: ViewNodeController | null = null
  @State childNodeController: ViewNodeController | null = null

  aboutToAppear() {
    let curModel = new XComponentModel(this.windowId.toString(), XComponentType.SURFACE, CommonConstants.XCOMPONENT_LIBRARY_NAME)
    let nodeParams = new NodeParams(0, 0, '100%', '100%', NodeType.XComponent, curModel);
    this.rootNodeController = addRootNode(this.windowId, this.uiContext as UIContext, nodeParams)
    entry.setRootViewControl(this.rootNodeController)
    const context = getContext(this) as common.UIAbilityContext
    notifySdlAboutToAppear(context, this.windowId)
    setWindowStyle(context, true)
  }

  aboutToDisappear(): void {
    notifySdlAboutToDisappear()
  }

  onPageShow(): void {
    notifySdlPageShow()
  }

  onPageHide(): void {
    notifySdlPageHide()
  }

  build() {
    Stack() {
      NodeContainer(this.rootNodeController)
    }
  }
}
