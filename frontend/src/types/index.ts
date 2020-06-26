interface IMethod {
  name: string;
  pointer_receiver: boolean;
  receiver: string;
  parameters: string[];
  return_values: string[];
}

export interface ICustomTypeResult {
  id: number;
  type: {
    package: string;
    name: string;
    type: number;
    base_type: string;
    methods: IMethod[];
  };
}
